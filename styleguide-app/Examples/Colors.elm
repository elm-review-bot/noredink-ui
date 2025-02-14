module Examples.Colors exposing (example, State, Msg)

{-|

@docs example, State, Msg

-}

import AtomicDesignType exposing (AtomicDesignType(..))
import Category exposing (Category(..))
import Color exposing (highContrast)
import Css
import Example exposing (Example)
import Html.Styled as Html
import Html.Styled.Attributes as Attributes exposing (css)
import KeyboardSupport exposing (Direction(..), Key(..))
import Nri.Ui.Colors.Extra
import Nri.Ui.Colors.V1 as Colors
import Nri.Ui.Heading.V2 as Heading


type alias ColorExample =
    ( String, Css.Color, String )


type alias State =
    ()


{-| -}
type alias Msg =
    ()


{-| -}
example : Example State Msg
example =
    { name = "Colors"
    , version = 1
    , categories = [ Colors ]
    , atomicDesignType = Atom
    , keyboardSupport = []
    , state = ()
    , update = \_ state -> ( state, Cmd.none )
    , subscriptions = \_ -> Sub.none
    , view =
        \_ ->
            [ [ ( "gray20", Colors.gray20, "Main text" )
              , ( "gray45", Colors.gray45, "Secondary text, 0-69 score" )
              , ( "gray75", Colors.gray75, "Border of form elements and tabs" )
              , ( "gray85", Colors.gray85, "Alternate for divider lines and container borders" )
              , ( "gray92", Colors.gray92, "Dvdrs/rules, incomplete assmt, inactive tabs/dsbld buttons" )
              , ( "gray96", Colors.gray96, "backgrounds/alternating rows" )
              , ( "navy", Colors.navy, "Headings, indented compts, labels, tooltip bckgrnds" )
              , ( "azure", Colors.azure, "Buttons, other clickable stuff, links" )
              , ( "azureDark", Colors.azureDark, "Azure button shadow" )
              , ( "frost", Colors.frost, "Blue backgrounds pairing with Navy and Azure" )
              , ( "glacier", Colors.glacier, "Blue highlights/selected elements" )
              , ( "lichen", Colors.lichen, "70-79 score" )
              , ( "grassland", Colors.grassland, "80-89 score" )
              , ( "green", Colors.green, "90-100 score" )
              , ( "greenDark", Colors.greenDark, "Green button, swathes of green" )
              , ( "greenDarkest", Colors.greenDarkest, "Green text, green button shadow" )
              , ( "greenLight", Colors.greenLight, "Green backgrounds" )
              , ( "greenLightest", Colors.greenLightest, "Green backgrounds" )
              , ( "cornflower", Colors.cornflower, "Mastery level 1" )
              , ( "cornflowerDark", Colors.cornflowerDark, "Mastery level 1 text" )
              , ( "cornflowerLight", Colors.cornflowerLight, "Background to pair with Cornflower elements" )
              , ( "aqua", Colors.aqua, "Master level 2" )
              , ( "aquaDark", Colors.aquaDark, "Text to pair with Aqua elements" )
              , ( "aquaLight", Colors.aquaLight, "Background to pair with Aqua elements" )
              , ( "turquoise", Colors.turquoise, "Master level 3, writing cycles" )
              , ( "turquoiseDark", Colors.turquoiseDark, "Text to pair with turquoise elements" )
              , ( "turquoiseLight", Colors.turquoiseLight, "Background to pair with turquoise elements" )
              , ( "purple", Colors.purple, "Wrong, form errors, diagnostics, purple button" )
              , ( "purpleDark", Colors.purpleDark, "Purple text, purple button shadow" )
              , ( "purpleLight", Colors.purpleLight, "Purple backgrounds" )
              , ( "red", Colors.red, "NoRedInk red, form warnings, practice" )
              , ( "redDark", Colors.redDark, "Red links/text, red button shadow" )
              , ( "redLight", Colors.redLight, "Red backgrounds" )
              , ( "cyan", Colors.cyan, "Blue Highlighter" )
              , ( "magenta", Colors.magenta, "Pink highlighter" )
              , ( "mustard", Colors.mustard, "Diagnostic assignments, some Premium elements" )
              , ( "ochre", Colors.ochre, "Practice assignments background color, some Premium elements" )
              , ( "ochreDark", Colors.ochreDark, "Practice assignments text color" )
              , ( "sunshine", Colors.sunshine, "Yellow highlights, tips" )
              ]
                |> viewColors
            , Heading.h3 [] [ Html.text "Background Highlight Colors" ]
            , Html.p [] [ Html.text "Background highlights should be used as the default highlight style because they are more noticeable and readable. The dark colors should be used in the case where headings need to harmonize with highlighted containers, such as in Guided Drafts." ]
            , [ ( "highlightYellow", Colors.highlightYellow, "Yellow background highlights" )
              , ( "highlightYellowDark", Colors.highlightYellowDark, "Dark yellow background highlights" )
              , ( "highlightCyan", Colors.highlightCyan, "Cyan background highlights" )
              , ( "highlightCyanDark", Colors.highlightCyanDark, "Dark cyan background highlights" )
              , ( "highlightMagenta", Colors.highlightMagenta, "Magenta background highlights" )
              , ( "highlightMagentaDark", Colors.highlightMagentaDark, "Dark magenta background highlights" )
              , ( "highlightGreen", Colors.highlightGreen, "Green background highlights" )
              , ( "highlightGreenDark", Colors.highlightGreenDark, "Dark green background highlights" )
              , ( "highlightBlue", Colors.highlightBlue, "Blue background highlights" )
              , ( "highlightBlueDark", Colors.highlightBlueDark, "Dark blue background highlights" )
              , ( "highlightPurple", Colors.highlightPurple, "Purple background highlights" )
              , ( "highlightPurpleDark", Colors.highlightPurpleDark, "Dark purple background highlights" )
              , ( "highlightBrown", Colors.highlightBrown, "Brown background highlights" )
              , ( "highlightBrownDark", Colors.highlightBrownDark, "Dark brown background highlights" )
              ]
                |> viewColors
            , Heading.h3 [] [ Html.text "Text Highlight Colors" ]
            , Html.p [] [ Html.text "Colors for highlighting text on a white background.  These colors are readable at 14px bold and bigger." ]
            , [ ( "textHighlightYellow", Colors.textHighlightYellow, "Neutral text highlight #1" )
              , ( "textHighlightCyan", Colors.textHighlightCyan, "Neutral text highlight #2" )
              , ( "textHighlightMagenta", Colors.textHighlightMagenta, "Neutral text highlight #3" )
              , ( "textHighlightGreen", Colors.textHighlightGreen, "Neutral text highlight #4, Positive text highlight #1" )
              , ( "textHighlightBlue", Colors.textHighlightBlue, "Neutral text highlight #5, Positive text highlight #2" )
              , ( "textHighlightPurple", Colors.textHighlightPurple, "Negative text highlight #1" )
              , ( "textHighlightBrown", Colors.textHighlightBrown, "Negative text highlight #2" )
              ]
                |> viewColors
            ]
    }


viewColors : List ColorExample -> Html.Html msg
viewColors colors =
    colors
        |> List.map viewColor
        |> Html.div
            [ css
                [ Css.maxWidth (Css.px 12000)
                , Css.displayFlex
                , Css.flexWrap Css.wrap
                ]
            ]


viewColor : ColorExample -> Html.Html msg
viewColor ( name, color, description ) =
    Html.div
        [ css
            [ -- Dimensions
              Css.minWidth (Css.px 250)
            , Css.maxWidth (Css.px 250)
            , Css.minHeight (Css.px 160)
            , Css.maxHeight (Css.px 160)
            , Css.margin (Css.px 4)
            , Css.padding (Css.px 8)
            , Css.borderRadius (Css.px 4)

            -- Interior spacing
            , Css.displayFlex
            , Css.flexDirection Css.column
            , Css.justifyContent Css.center
            , Css.alignItems Css.center

            -- Colors
            , Css.backgroundColor color
            , Nri.Ui.Colors.Extra.fromCssColor color
                |> highContrast
                |> Nri.Ui.Colors.Extra.toCssColor
                |> Css.color
            ]
        ]
        [ Html.div
            [ css [ Css.fontSize (Css.px 20) ]
            ]
            [ Html.text name ]
        , Html.div
            [ css
                [ Css.fontSize (Css.px 10)
                , Css.flexGrow (Css.num 1)
                , Css.textAlign Css.center
                ]
            ]
            [ Html.text description ]
        , Html.div
            [ css
                [ Css.fontSize (Css.px 20)
                , Css.flexGrow (Css.num 2)
                ]
            ]
            [ Html.text color.value ]
        ]
