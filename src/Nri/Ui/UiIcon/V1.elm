module Nri.Ui.UiIcon.V1 exposing
    ( seeMore, openClose, download, sort, gear, flipper, sortArrow
    , unarchive, share, preview
    , person, class, leaderboard, performance
    , calendar, clock
    , edit, pen
    , document, newspaper
    , arrowDown
    , checkmark, x
    , attention, exclamation
    , flag, star
    )

{-|


### Interface and actions

@docs seeMore, openClose, download, sort, gear, flipper, sortArrow
@docs unarchive, share, preview


### Humans & class

@docs person, class, leaderboard, performance


### Time

@docs calendar, clock


### Writing utensils and docs

@docs edit, pen
@docs document, newspaper


### Sticky things

@docs arrowDown
@docs checkmark, x
@docs attention, exclamation

    import Html.Styled exposing (..)
    import Nri.Ui.Colors.V1 as Colors
    import Nri.Ui.Svg.V1 as Svg
    import Nri.Ui.UiIcon.V1 as UiIcon

    view : Html msg
    view =
        Svg.toHtml (Svg.withColor Colors.lichen UiIcon.unarchive)


### Notifs

@docs flag, star

-}

import Nri.Ui.Svg.V1
import Svg.Styled as Svg
import Svg.Styled.Attributes as Attributes


{-| -}
unarchive : Nri.Ui.Svg.V1.Svg
unarchive =
    Svg.svg
        [ Attributes.width "100%"
        , Attributes.height "100%"
        , Attributes.viewBox "0 0 25 25"
        ]
        [ Svg.path
            [ Attributes.fill "currentcolor"
            , Attributes.fillRule "evenodd"
            , Attributes.d "M.858 22.7c.026.233.104.46.228.66.128.205.292.385.484.531.202.154.428.274.669.355.25.085.515.129.78.129h18.954a2.435 2.435 0 0 0 1.455-.484c.19-.145.356-.323.484-.526.124-.2.202-.425.228-.66l.85-7.696a1.716 1.716 0 0 0-.49-1.403 1.94 1.94 0 0 0-.653-.431 2.244 2.244 0 0 0-.841-.16H1.999a2.239 2.239 0 0 0-.84.16 1.93 1.93 0 0 0-.653.431 1.724 1.724 0 0 0-.4.634 1.72 1.72 0 0 0-.097.769l.849 7.69zm6.327-5.2a.906.906 0 0 1 .213-.3c.097-.09.209-.16.332-.206.132-.05.271-.076.413-.076a1.149 1.149 0 0 1 .764.282c.1.082.183.184.243.3.058.112.09.237.093.365l.042 1.376h6.427l.041-1.376h.001a.86.86 0 0 1 .09-.366.992.992 0 0 1 .24-.3c.102-.088.22-.158.346-.205a1.162 1.162 0 0 1 .832 0c.123.047.236.116.331.205a.834.834 0 0 1 .282.666l-.112 2.283a.837.837 0 0 1-.099.35.973.973 0 0 1-.234.284 1.176 1.176 0 0 1-.739.26H8.307c-.137 0-.275-.024-.404-.071a1.119 1.119 0 0 1-.348-.181.967.967 0 0 1-.234-.285.828.828 0 0 1-.1-.349l-.112-2.283a.83.83 0 0 1 .076-.374zM18.635 2.81h-2.183l.065-.962A2.715 2.715 0 0 0 16.35.717c0-.031-.026-.06-.038-.092l3.493.001c.588 0 1.089.427 1.187 1.012l1.616 9.548h-2.433l-1.358-8.204a.193.193 0 0 0-.19-.162l.007-.009zM8.932.707h.001a2.713 2.713 0 0 0-.167 1.139l.066.962H6.649a.194.194 0 0 0-.19.164l-1.358 8.214H2.668l1.616-9.545A1.209 1.209 0 0 1 5.474.628h3.492c-.014.037-.03.058-.04.09l.007-.01zM8.795 4.68a.812.812 0 0 0-.064.263.767.767 0 0 0 .182.542.844.844 0 0 0 .161.152 1.172 1.172 0 0 0 .432.179c.08.015.163.024.245.024h1.16l-.132 4.095a.91.91 0 0 0 .275.686 1.037 1.037 0 0 0 .719.29h1.73a1.044 1.044 0 0 0 .719-.29.91.91 0 0 0 .275-.686l-.133-4.097h1.213c.095 0 .19-.012.281-.034.09-.022.178-.056.26-.101a.839.839 0 0 0 .357-.36.782.782 0 0 0 .06-.547.845.845 0 0 0-.115-.255.916.916 0 0 0-.091-.116L13.413 1.2a.833.833 0 0 0-.154-.135 1.136 1.136 0 0 0-1.24 0 .851.851 0 0 0-.155.135L8.952 4.417a.939.939 0 0 0-.164.252l.007.01z"
            ]
            []
        ]
        |> Nri.Ui.Svg.V1.fromHtml


{-| -}
share : Nri.Ui.Svg.V1.Svg
share =
    Svg.svg
        [ Attributes.width "100%"
        , Attributes.height "100%"
        , Attributes.fill "currentcolor"
        , Attributes.viewBox "0 0 30 30"
        ]
        [ Svg.path
            [ Attributes.d "M18.5,0.1H1.8C0.3,0.1,0,0.5,0,1.9v26.2C0,29.7,0.4,30,1.8,30h26.3c1.5,0,1.8-0.3,1.8-1.8V12.3l-3.1,2.6v12H3.1V3.2h12.4L18.5,0.1z M23,9.9v4.2l7-7l-7-7v3.5C6.8,4.2,6.8,19.7,6.8,19.7S11.6,10.6,23,9.9z"
            ]
            []
        , Svg.path
            [ Attributes.fill "none"
            , Attributes.d "M18.5,0.1H1.8C0.3,0.1,0,0.5,0,1.9v26.2C0,29.7,0.4,30,1.8,30h26.3c1.5,0,1.8-0.3,1.8-1.8V12.3l-3.1,2.6v12H3.1V3.2h12.4L18.5,0.1z M23,9.9v4.2l7-7l-7-7v3.5C6.8,4.2,6.8,19.7,6.8,19.7S11.6,10.6,23,9.9z"
            ]
            []
        , Svg.path
            [ Attributes.fill "none"
            , Attributes.d "M-793.3-401V715h1024V-401H-793.3z"
            ]
            []
        , Svg.path
            [ Attributes.fill "none"
            , Attributes.d "M-815.4-385.9v1116h1024v-1116L-815.4-385.9L-815.4-385.9z"
            ]
            []
        ]
        |> Nri.Ui.Svg.V1.fromHtml


{-| -}
seeMore : Nri.Ui.Svg.V1.Svg
seeMore =
    Svg.svg
        [ Attributes.width "100%"
        , Attributes.height "100%"
        , Attributes.fill "currentcolor"
        , Attributes.viewBox "0 0 30 30"
        ]
        [ Svg.ellipse [ Attributes.cx "8.1", Attributes.cy "15", Attributes.rx "2.3", Attributes.ry "2.2" ] []
        , Svg.ellipse [ Attributes.cx "15", Attributes.cy "15", Attributes.rx "2.3", Attributes.ry "2.2" ] []
        , Svg.ellipse [ Attributes.cx "21.5", Attributes.cy "15", Attributes.rx "2.3", Attributes.ry "2.2" ] []
        , Svg.path [ Attributes.d "M28.3,0H1.9C1.1,0,0.7,0.1,0.4,0.4C0.1,0.7,0,1.1,0,1.9v26.2C0,29.7,0.4,30,1.8,30H27h1.1h0.1c0.1,0,0.2,0,0.3,0c0,0,0.1,0,0.1,0c0.1,0,0.3,0,0.4-0.1c0,0,0,0,0,0c0.8-0.2,1-0.6,1-1.7V1.9C30.1,0.4,29.7,0,28.3,0z M26.8,27H3.1v-0.1V3.2V3.1h0.1H27v23.8V27H26.8z" ] []
        ]
        |> Nri.Ui.Svg.V1.fromHtml


{-| -}
preview : Nri.Ui.Svg.V1.Svg
preview =
    Svg.svg
        [ Attributes.width "100%"
        , Attributes.height "100%"
        , Attributes.fill "currentcolor"
        , Attributes.viewBox "0 5 25 15"
        , Attributes.fillRule "evenodd"
        ]
        [ Svg.path [ Attributes.d "M12.5,5 C18.0555556,5 25,12.5 25,12.5 C25,12.5 18.0555556,20 12.5,20 C6.94444444,20 0,12.5 0,12.5 C3.2637037,9.26571429 7.62444444,5.19964286 12.5,5 Z M12.5,8.48214286 C10.1981481,8.48214286 8.33333333,10.28 8.33333333,12.5 C8.33333333,14.7196429 10.1981481,16.5178571 12.5,16.5178571 C14.8018519,16.5178571 16.6666667,14.7196429 16.6666667,12.5 C16.6666667,10.28 14.8018519,8.48214286 12.5,8.48214286 Z M12.5,14.5089286 C11.35,14.5089286 10.4166667,13.6085714 10.4166667,12.5 C10.4166667,11.3910714 11.35,10.4910714 12.5,10.4910714 C13.65,10.4910714 14.5833333,11.3910714 14.5833333,12.5 C14.5833333,13.6085714 13.65,14.5089286 12.5,14.5089286 Z" ] [] ]
        |> Nri.Ui.Svg.V1.fromHtml


{-| -}
performance : Nri.Ui.Svg.V1.Svg
performance =
    Svg.svg
        [ Attributes.width "100%"
        , Attributes.height "100%"
        , Attributes.fill "currentcolor"
        , Attributes.viewBox "0 0 30 30"
        ]
        [ Svg.polygon [ Attributes.points "22.1,24.6 22.1,8.4 17.8,7.1 17.8,24.6 " ] []
        , Svg.polygon [ Attributes.points "24.2,7.7 24.2,24.6 28.5,24.6 28.5,5 26.3,3.5 " ] []
        , Svg.polygon [ Attributes.points "5,15.6 5,24.6 9.3,24.6 9.3,12.3 5.8,16.5 " ] []
        , Svg.polygon [ Attributes.points "11.4,24.6 15.7,24.6 15.7,6.5 14.5,6.2 11.4,9.8 " ] []
        , Svg.path [ Attributes.fill "none", Attributes.d "M33.6,26.9H30v1.2c0,1.6-0.4,1.8-1.8,1.8H1.8C0.4,30,0,29.7,0,28.2V1.9c0-1.4,0.3-1.8,1.8-1.8H3v-5.5h30.6V26.9z" ] []
        , Svg.path [ Attributes.d "M3.1,26.9V3.2V0.1H1.8C0.3,0.1,0,0.5,0,1.9v26.2C0,29.7,0.4,30,1.8,30h26.3c1.5,0,1.8-0.3,1.8-1.8V27h-3.1H3.1V26.9z" ] []
        , Svg.path [ Attributes.fill "none", Attributes.d "M-715-401V715H309V-401H-715z" ] []
        , Svg.path [ Attributes.fill "none", Attributes.d "M-737.2-385.9v1116h1024v-1116L-737.2-385.9L-737.2-385.9z" ] []
        ]
        |> Nri.Ui.Svg.V1.fromHtml


{-| -}
openClose : Nri.Ui.Svg.V1.Svg
openClose =
    Svg.svg
        [ Attributes.width "100%"
        , Attributes.height "100%"
        , Attributes.fill "currentcolor"
        , Attributes.viewBox "0 0 14 12"
        ]
        [ Svg.path [ Attributes.d "M8.3,10.6c0,0.2-0.1,0.9,0.3,0.9h2.9c1.4,0,2.6-1.2,2.6-2.6V2.6C14,1.2,12.8,0,11.4,0 H8.6C8.4,0,8.3,0.1,8.3,0.3c0,0.3-0.1,0.9,0.3,0.9h2.9c0.8,0,1.4,0.6,1.4,1.4v6.3c0,0.8-0.6,1.4-1.4,1.4H8.9 C8.6,10.3,8.3,10.2,8.3,10.6z M0,5.7C0,5.9,0.1,6,0.2,6.1L5,11c0.1,0.1,0.2,0.2,0.4,0.2c0.3,0,0.6-0.3,0.6-0.6V8h4 c0.3,0,0.6-0.3,0.6-0.6V4c0-0.3-0.3-0.6-0.6-0.6H6V0.9c0-0.3-0.3-0.6-0.6-0.6C5.3,0.3,5.1,0.3,5,0.5L0.2,5.3C0.1,5.4,0,5.6,0,5.7z" ] [] ]
        |> Nri.Ui.Svg.V1.fromHtml


{-| -}
download : Nri.Ui.Svg.V1.Svg
download =
    Svg.svg
        [ Attributes.width "100%"
        , Attributes.height "100%"
        , Attributes.fill "currentcolor"
        , Attributes.viewBox "0 0 21 21"
        ]
        [ Svg.path
            [ Attributes.fillRule "evenodd"
            , Attributes.d "M17.719 12.467H21v5.25a1.968 1.968 0 0 1-1.969 1.97H1.97A1.968 1.968 0 0 1 0 17.716v-5.25h3.281v3.938H17.72v-3.938zM5.647 9.17h.001a1.024 1.024 0 0 1-.082-.332.967.967 0 0 1 .046-.352A1.037 1.037 0 0 1 6 7.962c.08-.057.166-.104.257-.14a1.642 1.642 0 0 1 .597-.115h1.462l-.167-5.163a1.148 1.148 0 0 1 .347-.865 1.307 1.307 0 0 1 .906-.365h2.18c.172 0 .343.034.503.1.15.06.287.151.404.265a1.148 1.148 0 0 1 .347.865l-.168 5.165h1.529c.12 0 .24.015.354.043.114.027.225.07.328.127a1.058 1.058 0 0 1 .45.453.985.985 0 0 1 .076.69 1.065 1.065 0 0 1-.06.166 1.01 1.01 0 0 1-.2.302l-3.676 4.064a1.05 1.05 0 0 1-.194.17 1.432 1.432 0 0 1-1.326.126 1.29 1.29 0 0 1-.236-.126 1.073 1.073 0 0 1-.197-.17L5.845 9.5a1.183 1.183 0 0 1-.207-.318l.009-.013z"
            ]
            []
        ]
        |> Nri.Ui.Svg.V1.fromHtml


{-| -}
edit : Nri.Ui.Svg.V1.Svg
edit =
    Svg.svg
        [ Attributes.width "100%"
        , Attributes.height "100%"
        , Attributes.fill "currentcolor"
        , Attributes.viewBox "0 0 30 30"
        ]
        [ Svg.path [ Attributes.d "M27.3,7.9l-5.2-5.2l2.3-2.3c0.5-0.5,1.2-0.5,1.7,0L29.7,4c0.5,0.5,0.5,1.2,0,1.7L27.3,7.9z M25.9,9.4L8.6,26.6l-5.2-5.2L20.6,4.1L25.9,9.4z M0,30l1.9-7L7,28.1L0,30z" ] []
        , Svg.path [ Attributes.fill "none", Attributes.d "M-753.8-401V715h1024V-401H-753.8z" ] []
        , Svg.path [ Attributes.fill "none", Attributes.d "M-775.9-385.9v1116h1024v-1116L-775.9-385.9L-775.9-385.9z" ] []
        ]
        |> Nri.Ui.Svg.V1.fromHtml


{-| -}
gear : Nri.Ui.Svg.V1.Svg
gear =
    Svg.svg
        [ Attributes.width "100%"
        , Attributes.height "100%"
        , Attributes.fill "currentcolor"
        , Attributes.viewBox "0 0 25 25"
        ]
        [ Svg.path
            [ Attributes.fillRule "evenodd"
            , Attributes.d "M3.282 14.744A9.583 9.583 0 0 0 4.52 17.62l-1.557 1.565c-.7.699-.693 1.115-.077 1.73l1.519 1.52c.62.623 1.045.61 1.73-.077l1.635-1.641c.77.443 1.603.782 2.487 1v2c0 .993.3 1.282 1.167 1.282h2.154c.878 0 1.167-.309 1.167-1.282v-2a9.582 9.582 0 0 0 2.487-1l1.672 1.68c.693.686 1.109.699 1.73.083l1.526-1.526c.607-.608.62-1.025-.084-1.73l-1.602-1.602a9.417 9.417 0 0 0 1.243-2.878h2.116c.88-.001 1.168-.31 1.168-1.283v-1.924c0-.95-.25-1.282-1.167-1.282h-2.115a9.582 9.582 0 0 0-1-2.487l1.526-1.519c.673-.673.731-1.09.083-1.731l-1.525-1.526c-.61-.61-1.046-.602-1.731.083L17.62 4.52a9.583 9.583 0 0 0-2.877-1.237v-2c0-.95-.25-1.282-1.167-1.282h-2.154c-.866 0-1.167.314-1.167 1.282v2A9.583 9.583 0 0 0 7.38 4.52l-1.45-1.443c-.685-.685-1.121-.692-1.73-.083L2.672 4.52c-.648.64-.59 1.058.083 1.731l1.52 1.52a9.765 9.765 0 0 0-.994 2.486H1.167C.3 10.256 0 10.57 0 11.538v1.924c0 .993.3 1.282 1.167 1.282h2.115zm5.55-2.244a3.666 3.666 0 0 1 7.334 0 3.667 3.667 0 1 1-7.334 0z"
            ]
            []
        ]
        |> Nri.Ui.Svg.V1.fromHtml


{-| -}
sort : Nri.Ui.Svg.V1.Svg
sort =
    Svg.svg
        [ Attributes.width "100%"
        , Attributes.height "100%"
        , Attributes.fill "currentcolor"
        , Attributes.viewBox "0 0 21 21"
        ]
        [ Svg.path
            [ Attributes.fillRule "evenodd"
            , Attributes.d "M0 5.048h21V2H0v3.048zm0 7.4h14.438V9.402H0v3.048zm0 7.402h7v-3.048H0v3.048z"
            ]
            []
        ]
        |> Nri.Ui.Svg.V1.fromHtml


{-| -}
calendar : Nri.Ui.Svg.V1.Svg
calendar =
    Svg.svg
        [ Attributes.width "100%"
        , Attributes.height "100%"
        , Attributes.fill "currentcolor"
        , Attributes.viewBox "0 0 21 21"
        ]
        [ Svg.path [ Attributes.fillRule "evenodd", Attributes.d "M19.483 5.097v13.709c-.151 1.053-.848 1.909-1.756 2.194H2.7C1.67 20.677.913 19.621.913 18.376V5.526c0-1.5 1.101-2.725 2.449-2.725h2.515V.725c0-.4.293-.725.652-.725.36 0 .652.326.652.725v2.076h6.065V.725c0-.4.293-.725.652-.725.359 0 .651.326.651.725v2.076h2.516c1.216 0 2.232.998 2.418 2.296zM3.362 4.25h2.515v1c0 .4.293.725.652.725.36 0 .652-.325.652-.725v-1h6.043v1c0 .4.292.725.652.725.359 0 .651-.325.651-.725v-1h2.516c.629 0 1.145.576 1.145 1.275v2.424H2.217V5.525c0-.7.515-1.275 1.145-1.275zm13.703 15.401H3.362c-.63 0-1.145-.575-1.145-1.275v-8.95H18.21v8.95c0 .7-.516 1.275-1.145 1.275z" ] []
        , Svg.path [ Attributes.fillRule "nonzero", Attributes.d "M3.652 10.957h1.826v1.826H3.652z" ] []
        , Svg.path [ Attributes.fillRule "nonzero", Attributes.d "M3.652 13.696h1.826v1.826H3.652zM6.391 10.957h1.826v1.826H6.391zM6.391 13.696h1.826v1.826H6.391zM9.13 10.957h1.826v1.826H9.13zM9.13 13.696h1.826v1.826H9.13zM11.87 10.957h1.826v1.826H11.87zM11.87 13.696h1.826v1.826H11.87zM14.609 10.957h1.826v1.826h-1.826zM14.609 13.696h1.826v1.826h-1.826zM3.652 16.435h1.826v1.826H3.652zM6.391 16.435h1.826v1.826H6.391zM9.13 16.435h1.826v1.826H9.13zM11.87 16.435h1.826v1.826H11.87zM14.609 16.435h1.826v1.826h-1.826z" ] []
        ]
        |> Nri.Ui.Svg.V1.fromHtml


{-| -}
document : Nri.Ui.Svg.V1.Svg
document =
    Svg.svg
        [ Attributes.width "100%"
        , Attributes.height "100%"
        , Attributes.fill "currentcolor"
        , Attributes.viewBox "0 0 21 21"
        ]
        [ Svg.path [ Attributes.d "M13.41.219H4.742a2.703 2.703 0 0 0-2.699 2.699V18.08c0 1.487 1.211 2.699 2.7 2.699h11.051c1.488 0 2.7-1.212 2.7-2.7V5.899L13.41.218zm.356 2.327l2.644 2.956h-2.644V2.546zm2.026 16.949H4.742A1.414 1.414 0 0 1 3.33 18.08V2.918c0-.779.634-1.414 1.412-1.414h7.739v5.282h4.725V18.08c0 .78-.634 1.414-1.414 1.414z" ] []
        , Svg.path [ Attributes.d "M6.355 10.072V8.785h7.824v1.287H6.355zm0 2.964V11.75h7.824v1.286H6.355zm0 2.965v-1.287h7.824v1.287H6.355z" ] []
        ]
        |> Nri.Ui.Svg.V1.fromHtml


{-| -}
leaderboard : Nri.Ui.Svg.V1.Svg
leaderboard =
    Svg.svg
        [ Attributes.width "100%"
        , Attributes.height "100%"
        , Attributes.viewBox "0 0 20 15"
        ]
        [ Svg.g
            [ Attributes.stroke "none"
            , Attributes.strokeWidth "1"
            , Attributes.fill "none"
            , Attributes.fillRule "evenodd"
            ]
            [ Svg.g
                [ Attributes.transform "translate(-248.000000, -856.000000)"
                , Attributes.fill "currentcolor"
                ]
                [ Svg.g [ Attributes.transform "translate(248.000000, 856.000000)" ]
                    [ Svg.g []
                        [ Svg.path [ Attributes.d "M12.03078,1.83673 C12.02989,2.77336 11.17837,3.62577 10.24174,3.62577 C9.305327,3.62577 8.452916,2.77425 8.452916,1.83673 C8.452027,0.89921 9.305327,0.04591 10.24174,0.04591 C11.17925,0.04591 12.03078,0.89921 12.03078,1.83673" ] []
                        , Svg.path [ Attributes.d "M8.270612,4.33576 C7.379091,4.33576 6.659563,5.0544 6.659563,5.94681 C6.659563,6.04747 6.667341,6.14725 6.682896,6.24347 L8.006622,12.95254 C8.173282,13.663401 8.814813,14.174714 9.569006,14.174714 L10.9154,14.174714 C11.66959,14.174714 12.33468,13.627847 12.47778,12.95254 L13.79817,6.24347 C13.81551,6.14636 13.82506,6.04659 13.82506,5.94681 C13.82506,5.05529 13.09842,4.33576 12.2069,4.33576 L10.9014,4.33576 C10.90229,4.34265 10.90229,4.34954 10.9014,4.35665 L10.49875,6.3148 C10.79207,6.42857 11.01962,6.72545 11.01962,7.04388 C11.01962,7.45098 10.64896,7.82163 10.24187,7.82163 C9.834773,7.82163 9.464121,7.45098 9.464121,7.04388 C9.464121,6.72523 9.691445,6.42835 9.984989,6.3148 L9.582116,4.35665 C9.581227,4.34954 9.581227,4.34265 9.582116,4.33576 L8.270612,4.33576 Z M9.79833,4.33576 L10.19409,6.27324 C10.21054,6.27235 10.22609,6.26636 10.24276,6.26636 C10.2592,6.26636 10.27476,6.27235 10.2912,6.27324 L10.68718,4.33576 L9.79833,4.33576 Z" ] []
                        , Svg.path [ Attributes.d "M18.74145,6.12205 C18.74056,6.99268 17.94904,7.78421 17.0784,7.78421 C16.20777,7.78421 15.41513,6.99268 15.41513,6.12205 C15.41425,5.25053 16.20777,4.45811 17.0784,4.45811 C17.9497,4.45811 18.74234,5.25142 18.74145,6.12205" ] []
                        , Svg.path [ Attributes.d "M15.65304,8.446626 C14.82418,8.446626 14.15309,9.117711 14.15309,9.946568 C14.15309,10.040342 14.16176,10.132338 14.1782,10.221668 L14.74329,13.042892 C14.8804,13.704199 15.49326,14.174625 16.19479,14.174625 L17.9585,14.174625 C18.65981,14.174625 19.26045,13.704199 19.40978,13.042892 L19.97487,10.220779 C19.99131,10.131449 19.99998,10.038564 19.99998,9.945679 C19.99998,9.116822 19.32911,8.445737 18.50026,8.445737 L17.7154,8.445737 L17.33341,10.278999 C17.62696,10.392772 17.85428,10.68965 17.85428,11.008082 C17.85428,11.415177 17.48363,11.785829 17.07654,11.785829 C16.66944,11.785829 16.29879,11.415177 16.29879,11.008082 C16.29879,10.68965 16.52634,10.392772 16.81966,10.278999 L16.43767,8.445737 L15.65304,8.446626 Z M16.65989,8.446626 L17.02787,10.237445 C17.04431,10.236556 17.05987,10.230334 17.07631,10.230334 C17.09276,10.230334 17.10853,10.236556 17.12498,10.237445 L17.49296,8.446626 L16.65989,8.446626 Z" ] []
                        , Svg.path [ Attributes.d "M1.369747,4.78259 C1.370636,5.65322 2.16216,6.44475 3.032793,6.44475 C3.903426,6.44475 4.696062,5.65322 4.696062,4.78259 C4.696951,3.91107 3.903426,3.11866 3.032793,3.11866 C2.161494,3.11866 1.368858,3.91196 1.369747,4.78259" ] []
                        , Svg.path [ Attributes.d "M1.499942,7.10726 C0.671085,7.10726 0,7.77834 0,8.607197 C0,8.700972 0.00866633,8.792968 0.02511013,8.882298 L0.7013061,13.044358 C0.817746,13.664112 1.451277,14.176314 2.152805,14.176314 L3.916514,14.176314 C4.61782,14.176314 5.228019,13.705666 5.367791,13.044358 L6.043987,8.882298 C6.060431,8.792968 6.069097,8.700083 6.069097,8.607197 C6.069097,7.77834 5.398235,7.10726 4.569378,7.10726 L3.673413,7.10726 L3.29165,8.940518 C3.584972,9.054291 3.812296,9.351168 3.812296,9.669601 C3.812296,10.076696 3.441644,10.447348 3.034549,10.447348 C2.627453,10.447348 2.256801,10.076696 2.256801,9.669601 C2.256801,9.351168 2.484348,9.054291 2.77767,8.940518 L2.395685,7.10726 L1.499942,7.10726 Z M2.617898,7.10726 L2.985884,8.898075 C3.00255,8.897186 3.018105,8.890964 3.034549,8.890964 C3.050992,8.890964 3.06677,8.897186 3.083213,8.898075 L3.451199,7.10726 L2.617898,7.10726 Z" ] []
                        ]
                    ]
                ]
            ]
        ]
        |> Nri.Ui.Svg.V1.fromHtml


{-| -}
class : Nri.Ui.Svg.V1.Svg
class =
    Svg.svg
        [ Attributes.width "100%"
        , Attributes.height "100%"
        , Attributes.fill "currentcolor"
        , Attributes.viewBox "0 0 21 21"
        ]
        [ Svg.path [ Attributes.d "M2.66 20.576v-7.1l.002-.063V10.878l-.847 1.65c-.25.487-.834.689-1.304.447-.47-.24-.648-.833-.398-1.32l1.66-3.236c.03-.056.062-.109.099-.156.149-.432.56-.744 1.044-.744h2.95l-1.487 2.896c-.485.949-.16 2.151.823 2.657a1.92 1.92 0 0 0 1.85-.053l.037-.024v7.581H5.153v-6.095H4.65v6.095H2.66zm5.32 0v-7.743l.001-.072V9.968l-.933 1.817c-.276.54-.92.76-1.439.495-.518-.266-.713-.92-.438-1.457l1.83-3.566c.032-.062.068-.119.109-.172.164-.477.618-.82 1.15-.82h4.385c.534 0 .987.343 1.15.82.04.053.077.11.11.172l1.829 3.566c.277.538.08 1.191-.438 1.457-.519.265-1.162.044-1.438-.495l-.933-1.816v2.751c0 .037-.001.071-.005.106v7.75h-2.207v-6.638h-.527v6.638H7.98zm5.831 0V12.99l.043.03a1.92 1.92 0 0 0 1.85.052c.984-.506 1.308-1.708.822-2.657L15.04 7.52h2.949c.484 0 .895.312 1.044.744.036.049.07.1.099.156l1.66 3.235c.25.488.072 1.08-.398 1.321-.47.242-1.054.04-1.305-.448l-.846-1.649v2.497c0 .032-.001.064-.004.097V20.577h-1.99V14.48h-.502v6.095H13.81zM10.491 1a2.182 2.182 0 0 0 .001 4.363A2.182 2.182 0 0 0 10.494 1h-.004zM2.961 4.722a1.978 1.978 0 1 1 3.957 0 1.978 1.978 0 0 1-3.957 0zm11.096 0a1.978 1.978 0 1 1 3.957 0 1.978 1.978 0 0 1-3.957 0z" ] [] ]
        |> Nri.Ui.Svg.V1.fromHtml


{-| -}
person : Nri.Ui.Svg.V1.Svg
person =
    Svg.svg
        [ Attributes.width "100%"
        , Attributes.height "100%"
        , Attributes.fill "currentcolor"
        , Attributes.viewBox "0 0 18 18"
        ]
        [ Svg.path [ Attributes.d "M8.6,9.4c2.6,0,4.7-2.1,4.7-4.7c0-2.6-2.1-4.7-4.7-4.7C6,0,3.9,2.1,3.9,4.7C3.9,7.3,6,9.4,8.6,9.4L8.6,9.4z M0,17.6C0,17.8,0.2,18,0.4,18h16.4c0.2,0,0.4-0.2,0.4-0.4v-0.8c0-3.2-2.1-5.9-6.3-5.9H6.3C2.1,11,0,13.7,0,16.8V17.6z" ] []
        ]
        |> Nri.Ui.Svg.V1.fromHtml


{-| -}
clock : Nri.Ui.Svg.V1.Svg
clock =
    Svg.svg
        [ Attributes.width "100%"
        , Attributes.height "100%"
        , Attributes.fill "currentcolor"
        , Attributes.viewBox "0 0 15 15"
        ]
        [ Svg.path [ Attributes.d "M7.5,0C3.4,0,0,3.4,0,7.5S3.4,15,7.5,15S15,11.6,15,7.5S11.6,0,7.5,0L7.5,0z M7.5,13.5 c-3.3,0-6-2.7-6-6c0-3.3,2.7-6,6-6c3.3,0,6,2.7,6,6C13.5,10.8,10.8,13.5,7.5,13.5L7.5,13.5z" ] []
        , Svg.path [ Attributes.d "M7.4,9.3C7,9.3,6.6,8.9,6.6,8.4V4.4c0-0.5,0.3-0.9,0.8-0.9c0.4,0,0.7,0.4,0.7,0.8 c0,0,0,0,0,0V3.5c0,0,0,1,0,1v1.8c0,0.6,0,2.2,0,2.2C8.1,8.9,7.7,9.3,7.4,9.3z" ] []
        , Svg.path [ Attributes.d "M6.7,8.4C6.9,8,7.4,7.8,7.8,7.9l2.3,0.9c0.5,0.1,0.7,0.7,0.6,1c-0.1,0.3-0.6,0.6-1.1,0.5 L7.4,9.4C6.9,9.3,6.6,8.8,6.7,8.4z" ] []
        ]
        |> Nri.Ui.Svg.V1.fromHtml


{-| -}
flipper : Nri.Ui.Svg.V1.Svg
flipper =
    Svg.svg
        [ Attributes.width "100%"
        , Attributes.height "100%"
        , Attributes.fill "currentcolor"
        , Attributes.viewBox "0 0 21 18"
        ]
        [ Svg.path [ Attributes.fillRule "evenodd", Attributes.d "M6 12.59h8.59V4H6v8.59zm.955-.954h6.681V4.955H6.955v6.681zM6.682 16.204a.477.477 0 1 1 0 .955H5.25a3.345 3.345 0 0 1-3.341-3.34v-2.19L.815 12.724a.477.477 0 1 1-.675-.675l1.909-1.91a.477.477 0 0 1 .675 0l1.909 1.91a.477.477 0 1 1-.675.675l-1.094-1.095v2.19a2.388 2.388 0 0 0 2.386 2.385h1.432zM20.86 4.435a.477.477 0 0 0-.675 0L19.091 5.53V3.34A3.345 3.345 0 0 0 15.75 0h-1.432a.477.477 0 1 0 0 .955h1.432a2.388 2.388 0 0 1 2.386 2.386V5.53l-1.094-1.095a.477.477 0 1 0-.675.675l1.91 1.91a.475.475 0 0 0 .674 0l1.91-1.91a.477.477 0 0 0 0-.675" ] []
        , Svg.path [ Attributes.fillRule "evenodd", Attributes.d "M10 12h.716V4H10z" ] []
        , Svg.path [ Attributes.fillRule "evenodd", Attributes.d "M6.92 8.716h7.16V8H6.92z" ] []
        ]
        |> Nri.Ui.Svg.V1.fromHtml


{-| -}
newspaper : Nri.Ui.Svg.V1.Svg
newspaper =
    Svg.svg
        [ Attributes.width "100%"
        , Attributes.height "100%"
        , Attributes.fill "currentcolor"
        , Attributes.viewBox "0 0 25 25"
        ]
        [ Svg.path [ Attributes.d "M20.9,0.5v21.6c0,1.3,1.1,2.4,2.4,2.4H2.4c-1.3,0-2.4-1.1-2.4-2.4V0.5H20.9z M17.6,3.9h-6.8v4.8h6.8V3.9z M8.1,3.9H3.4C3,3.9,2.7,4.2,2.7,4.6C2.7,5,3,5.3,3.4,5.3h4.7c0.4,0,0.7-0.3,0.7-0.7C8.8,4.2,8.5,3.9,8.1,3.9L8.1,3.9z M25,8.7v13.4 c0,1-0.7,1.7-1.7,1.7c-0.9,0-1.7-0.8-1.7-1.7V8.7H25z M8.1,7.4H3.4C3,7.4,2.7,7.7,2.7,8c0,0.4,0.3,0.7,0.7,0.7h4.7 c0.4,0,0.7-0.3,0.7-0.7C8.8,7.7,8.5,7.4,8.1,7.4L8.1,7.4z M17.6,11.5H3.4c-0.4,0-0.7,0.3-0.7,0.7c0,0.4,0.3,0.7,0.7,0.7h14.2 c0.4,0,0.7-0.3,0.7-0.7C18.2,11.8,17.9,11.5,17.6,11.5L17.6,11.5z M17.6,15.2H3.4c-0.4,0-0.7,0.3-0.7,0.7c0,0.4,0.3,0.7,0.7,0.7 h14.2c0.4,0,0.7-0.3,0.7-0.7C18.2,15.5,17.9,15.2,17.6,15.2L17.6,15.2z M17.6,19H3.4c-0.4,0-0.7,0.3-0.7,0.7c0,0.4,0.3,0.7,0.7,0.7 h14.2c0.4,0,0.7-0.3,0.7-0.7C18.2,19.3,17.9,19,17.6,19L17.6,19z" ] []
        ]
        |> Nri.Ui.Svg.V1.fromHtml


{-| -}
pen : Nri.Ui.Svg.V1.Svg
pen =
    Svg.svg
        [ Attributes.width "100%"
        , Attributes.height "100%"
        , Attributes.fill "currentcolor"
        , Attributes.viewBox "0 0 63 63"
        ]
        [ Svg.path [ Attributes.d "M39.8,0L31,13.8l17.6,17.6l13.8-8.8L39.8,0z M27.9,16.4l-17.1,7L0,59.6l17.5-17.5 c-0.7-1.8-0.3-3.9,1.1-5.3c2-2,5.1-2,7.1,0s2,5.1,0,7.1c-1.4,1.4-3.6,1.8-5.3,1.1L2.8,62.4l36.3-10.8l7-17.1L27.9,16.4z" ] []
        ]
        |> Nri.Ui.Svg.V1.fromHtml


{-| -}
arrowDown : Nri.Ui.Svg.V1.Svg
arrowDown =
    Svg.svg
        [ Attributes.width "100%"
        , Attributes.height "100%"
        , Attributes.fill "currentcolor"
        , Attributes.viewBox "0 0 25 15"
        ]
        [ Svg.path
            [ Attributes.transform "rotate(270) translate(-20)"
            , Attributes.fillRule "evenodd"
            , Attributes.d "M19.2677026,20.7322696 C20.2443584,21.7070736 20.2443584,23.2915005 19.2677026,24.2677859 C18.7788191,24.7555583 18.139567,25 17.4999444,25 C16.8603219,25 16.2210698,24.7555583 15.7321863,24.2677859 L5.73229742,14.267897 C4.7556416,13.293093 4.7556416,11.7086662 5.73229742,10.7323808 L15.7321863,0.732491861 C16.7084718,-0.244163954 18.2914171,-0.244163954 19.2677026,0.732491861 C20.2443584,1.70729584 20.2443584,3.29172268 19.2677026,4.26800813 L11.0359422,12.5001389 L19.2677026,20.7322696 Z"
            ]
            []
        ]
        |> Nri.Ui.Svg.V1.fromHtml


{-| -}
sortArrow : Nri.Ui.Svg.V1.Svg
sortArrow =
    Svg.svg
        [ Attributes.width "100%"
        , Attributes.height "100%"
        , Attributes.fill "currentcolor"
        , Attributes.viewBox "0 0 8 6"
        ]
        [ Svg.polygon [ Attributes.points "0 6 4 0 8 6 0 6" ] [] ]
        |> Nri.Ui.Svg.V1.fromHtml


{-| -}
checkmark : Nri.Ui.Svg.V1.Svg
checkmark =
    Svg.svg
        [ Attributes.width "100%"
        , Attributes.height "100%"
        , Attributes.fill "currentcolor"
        , Attributes.viewBox "0 0 21.7 17.1"
        ]
        [ Svg.path [ Attributes.d "M7.6,17.1c-0.5,0-1-0.2-1.4-0.6l-5.6-5.4c-0.8-0.8-0.8-2-0.1-2.8c0.8-0.8,2-0.8,2.8-0.1l4.1,4L18.2,0.7c0.8-0.8,2-0.9,2.8-0.1s0.9,2,0.1,2.8l-12,13C8.7,16.9,8.2,17.1,7.6,17.1C7.7,17.1,7.6,17.1,7.6,17.1" ] []
        ]
        |> Nri.Ui.Svg.V1.fromHtml


{-| -}
x : Nri.Ui.Svg.V1.Svg
x =
    Svg.svg
        [ Attributes.width "100%"
        , Attributes.height "100%"
        , Attributes.fill "currentcolor"
        , Attributes.viewBox "0 0 25 25"
        ]
        [ Svg.path [ Attributes.d "M1.067 6.015c-1.423-1.422-1.423-3.526 0-4.948 1.422-1.423 3.526-1.423 4.948 0l6.371 6.37 6.371-6.37c1.422-1.423 3.783-1.423 5.176 0 1.423 1.422 1.423 3.782 0 5.176l-6.37 6.37 6.37 6.372c1.423 1.422 1.423 3.526 0 4.948-1.422 1.423-3.526 1.423-4.948 0l-6.371-6.37-6.371 6.37c-1.422 1.423-3.783 1.423-5.176 0-1.423-1.422-1.423-3.782 0-5.176l6.37-6.143-6.37-6.599z" ] [] ]
        |> Nri.Ui.Svg.V1.fromHtml


{-| -}
exclamation : Nri.Ui.Svg.V1.Svg
exclamation =
    Svg.svg
        [ Attributes.width "100%"
        , Attributes.height "100%"
        , Attributes.fill "currentcolor"
        , Attributes.viewBox "0 0 15 15"
        ]
        [ Svg.path [ Attributes.fillRule "evenodd", Attributes.d "M15,7.5 C15,3.35786438 11.6421356,0 7.5,0 C3.35786438,0 0,3.35786438 0,7.5 C0,11.6421357 3.35786438,15 7.5,15 C11.6421356,15 15,11.6421357 15,7.5 Z M7.488,3.00005693 C6.6910533,2.99332411 6.03236555,3.58464547 6,4.33587376 C6,4.65284725 6.66,8.34332427 6.66,8.34332427 C6.73077084,8.72726384 7.08695202,9.00567371 7.5,8.9999122 L7.536,8.9999122 C7.94904798,9.00567371 8.30522916,8.72726384 8.376,8.34332427 C8.44677084,7.9593847 9,4.65850749 9,4.33587376 C8.96812494,3.59558162 8.32732494,3.00848187 7.542,3.00005693 L7.488,3.00005693 Z M7.5,12 C8.05228477,12 8.5,11.5522847 8.5,11 C8.5,10.4477153 8.05228477,10 7.5,10 C6.94771523,10 6.5,10.4477153 6.5,11 C6.5,11.5522847 6.94771523,12 7.5,12 L7.5,12 Z" ] [] ]
        |> Nri.Ui.Svg.V1.fromHtml


{-| -}
attention : Nri.Ui.Svg.V1.Svg
attention =
    Svg.svg
        [ Attributes.width "100%"
        , Attributes.height "100%"
        , Attributes.fill "currentcolor"
        , Attributes.viewBox "0 0 5.05 15.43"
        ]
        [ Svg.ellipse
            [ Attributes.cx "2.52"
            , Attributes.cy "13.71"
            , Attributes.rx "1.76"
            , Attributes.ry "1.71"
            ]
            []
        , Svg.path
            [ Attributes.d "M2.57,0H2.48A2.46,2.46,0,0,0,0,2.36c0,.56,1.1,7.08,1.1,7.08a1.4,1.4,0,0,0,1.4,1.16h.06a1.4,1.4,0,0,0,1.4-1.16S5,2.93,5,2.36A2.46,2.46,0,0,0,2.57,0Z"
            ]
            []
        ]
        |> Nri.Ui.Svg.V1.fromHtml


{-| -}
flag : Nri.Ui.Svg.V1.Svg
flag =
    Svg.svg
        [ Attributes.width "100%"
        , Attributes.height "100%"
        , Attributes.fill "#F3336C"
        , Attributes.viewBox "0 0 25 25"
        ]
        [ Svg.path
            [ Attributes.fillRule "evenodd"
            , Attributes.d "M21.36 1.25C20.064.414 17.107-.368 13.036.324 9.688.894 6.155.308 5 .081a.965.965 0 0 0-1.36.895v23.051c0 .538.427.973.967.973.542 0 .98-.437.98-.973V12.933c1.242.414 3.589.931 6.564.35 4.043-.794 7.36.229 7.36.229 1.02-1.017 1.808-3.482 1.435-6.203-.407-2.958.414-6.06.414-6.06z"
            ]
            []
        ]
        |> Nri.Ui.Svg.V1.fromHtml


{-| -}
star : Nri.Ui.Svg.V1.Svg
star =
    Svg.svg
        [ Attributes.width "100%"
        , Attributes.height "100%"
        , Attributes.viewBox "0 0 25 24"
        ]
        [ Svg.defs []
            [ Svg.path
                [ Attributes.id "stara"
                , Attributes.d "M13.396.554l3.121 6.259a1 1 0 0 0 .744.542l6.89 1.054a1 1 0 0 1 .554 1.698l-4.966 4.937a1 1 0 0 0-.282.87l1.132 6.924a1 1 0 0 1-1.448 1.049l-6.18-3.216a1 1 0 0 0-.923 0L5.86 23.887a1 1 0 0 1-1.448-1.049l1.132-6.924a1 1 0 0 0-.282-.87L.295 10.107A1 1 0 0 1 .849 8.41l6.89-1.054a1 1 0 0 0 .744-.542l3.123-6.26a1 1 0 0 1 1.79.001z"
                ]
                []
            , Svg.filter
                [ Attributes.id "starb"
                , Attributes.x "-8%"
                , Attributes.y "-8.3%"
                , Attributes.width "116%"
                , Attributes.height "116.7%"
                ]
                [ Svg.feGaussianBlur
                    [ Attributes.in_ "SourceAlpha"
                    , Attributes.result "shadowBlurInner1"
                    , Attributes.stdDeviation "1.5"
                    ]
                    []
                , Svg.feOffset
                    [ Attributes.dy "1"
                    , Attributes.in_ "shadowBlurInner1"
                    , Attributes.result "shadowOffsetInner1"
                    ]
                    []
                , Svg.feComposite
                    [ Attributes.in_ "shadowOffsetInner1"
                    , Attributes.in2 "SourceAlpha"
                    , Attributes.k2 "-1"
                    , Attributes.k3 "1"
                    , Attributes.operator "arithmetic"
                    , Attributes.result "shadowInnerInner1"
                    ]
                    []
                , Svg.feColorMatrix
                    [ Attributes.in_ "shadowInnerInner1"
                    , Attributes.values
                        """
                        0 0 0 0 1
                        0 0 0 0 0.3
                        0 0 0 0 0
                        0 0 0 1 0
                        """
                    ]
                    []
                ]
            ]
        , Svg.g [ Attributes.fillRule "evenodd" ]
            [ Svg.use
                [ Attributes.fill "#FEC709"
                , Attributes.xlinkHref "#stara"
                ]
                []
            , Svg.use
                [ Attributes.fill "#000"
                , Attributes.filter "url(#starb)"
                , Attributes.xlinkHref "#stara"
                ]
                []
            ]
        ]
        |> Nri.Ui.Svg.V1.fromHtml
