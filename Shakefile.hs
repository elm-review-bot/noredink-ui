import Development.Shake
import Development.Shake.Command
import Development.Shake.FilePath
import Development.Shake.Util

main :: IO ()
main =
  -- TODO: better shake options. Parallelism, hash changes.
  shakeArgs
    shakeOptions
      { shakeFiles = "_build",
        shakeLintIgnore =
          [ "node_modules/**/*",
            ".git/**/*",
            "elm-stuff/**/*",
            "styleguide-app/elm-stuff/**/*"
          ],
        shakeThreads = 0,
        shakeChange = ChangeModtimeAndDigest
      }
    $ do
      -- phonies. These provide a nice public API for using shake (`shake
      -- clean`, `shake test`, etc.)
      phony "clean" $ do
        removeFilesAfter "elm-stuff" ["//*"]
        removeFilesAfter "log" ["//*"]
        removeFilesAfter "node_modules" ["//*"]
        removeFilesAfter "public" ["//*"]
        removeFilesAfter "styleguide-app" ["elm.js", "bundle.js", "elm-stuff"]

      phony "public" $ need ["log/public.txt"]

      phony "test" $ do
        need
          [ "log/npm-install.txt",
            "tests/elm-verify-examples.json",
            "log/elm-verify-examples.txt",
            "log/elm-test.txt",
            "log/axe-report.txt",
            "log/percy-tests.txt",
            "log/deprecated-imports-report.txt",
            "log/check-exposed.txt",
            "log/format.txt",
            "log/documentation.json"
          ]

      phony "ci" $ do need ["test", "public"]

      -- things that should be kept under version control
      "tests/elm-verify-examples.json" %> \out -> do
        need ["elm.json"]
        Stdout newConfig <- cmd "jq" "--indent" "4" ["{ root: \"../src\", tests: .[\"exposed-modules\"] }"] "elm.json"
        writeFileChanged out newConfig

      "script/deprecated-imports.csv" %> \out -> do
        elmFiles <- getDirectoryFiles "." ["src/**/*.elm", "tests/**/*.elm"]
        need (["elm.json", "script/deprecated-imports.py"] ++ elmFiles)
        cmd_ "script/deprecated-imports.py" "--imports-file" out "update"

      -- temporary files, used to produce CI reports
      "log/elm-test.txt" %> \out -> do
        elmFiles <- getDirectoryFiles "." ["tests/**/*.elm"]
        -- I'm not sure why elm-test needs package.json, but fsatracing it
        -- reveals the dep, so in it goes!
        need (["package.json", "elm.json"] ++ elmFiles)
        Stdout report <- cmd "elm-test"
        writeFileChanged out report

      "log/elm-verify-examples.txt" %> \out -> do
        elmFiles <- getDirectoryFiles "." ["src/**/*.elm"]
        need (["tests/elm-verify-examples.json"] ++ elmFiles)
        Stdout report <- cmd "elm-verify-examples"
        writeFileChanged out report

      "log/format.txt" %> \out -> do
        let placesToLook = ["src", "tests", "styleguide-app"]
        elmFiles <- getDirectoryFiles "." (map (\place -> place </> "**" </> "*.elm") placesToLook)
        need elmFiles
        Stdout report <- cmd "elm-format" "--validate" placesToLook
        writeFileChanged out report

      "log/percy-tests.txt" %> \out -> do
        percyToken <- getEnv "PERCY_TOKEN"
        case percyToken of
          Nothing -> do
            writeFileChanged out "Skipped running Percy tests, PERCY_TOKEN not set."
          Just _ -> do
            need ["log/npm-install.txt"]
            Stdout report <- cmd "script/percy-tests.sh"
            writeFileChanged out report

      "log/axe-report.json" %> \out -> do
        need ["log/npm-install.txt", "script/run-axe.sh", "script/axe-puppeteer.js"]
        Stdout report <- cmd "script/run-axe.sh"
        writeFileChanged out report

      "log/axe-report.txt" %> \out -> do
        need ["log/axe-report.json", "script/format-axe-report.sh", "script/axe-report.jq"]
        Stdout report <- cmd "script/format-axe-report.sh" "log/axe-report.json"
        writeFileChanged out report

      "log/deprecated-imports-report.txt" %> \out -> do
        elmFiles <- getDirectoryFiles "." ["src/**/*.elm", "tests/**/*.elm"]
        need (["elm.json", "script/deprecated-imports.py"] ++ elmFiles)
        -- still need to do something when this fails (e.g. run "check" instead of "report")
        Stdout report <- cmd "script/deprecated-imports.py report"
        writeFileChanged out report

      "log/check-exposed.txt" %> \out -> do
        elmFiles <- getDirectoryFiles "." ["src/**/*.elm"]
        need (["elm.json", "script/check-exposed.py"] ++ elmFiles)
        Stdout report <- cmd "script/check-exposed.py"
        writeFileChanged out report

      "log/documentation.json" %> \out -> do
        elmFiles <- getDirectoryFiles "." ["src/**/*.elm"]
        need elmFiles
        cmd_ "elm" "make" "--docs" out

      "public/bundle.js" %> \out -> do
        libJsFiles <- getDirectoryFiles "." ["lib/**/*.js"]
        need (["package.json", "lib/index.js", "styleguide-app/manifest.js", "log/npm-install.txt"] ++ libJsFiles)
        cmd_ "./node_modules/.bin/browserify" "--entry" "styleguide-app/manifest.js" "--outfile" out

      "public/elm.js" %> \out -> do
        elmSources <- getDirectoryFiles "." ["styleguide-app/**/*.elm", "src/**/*.elm"]
        need elmSources
        cmd_ (Cwd "styleguide-app") "elm" "make" "Main.elm" "--output" (".." </> out)

      "public/**/*" %> \out ->
        copyFileChanged (replaceDirectory1 out "styleguide-app") out

      "log/public.txt" %> \out -> do
        styleguideAssets <- getDirectoryFiles ("styleguide-app" </> "assets") ["**/*"]
        need
          ( ["public/index.html", "public/elm.js", "public/bundle.js"]
              ++ map (("public" </> "assets") </>) styleguideAssets
          )
        writeFileChanged out "build styleguide app successfully"

      -- dev deps we get dynamically instead of from Nix (frowny face)
      "log/npm-install.txt" %> \out -> do
        -- npm looks in some unrelated files for whatever reason. We mark
        -- them as used here to avoid getting linter errors.
        needed ["README.md"]

        -- now that we've satisfied the linter, let's build.
        need ["package.json", "package-lock.json"]
        Stdout report <- cmd "npm install"
        writeFileChanged out report
