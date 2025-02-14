module Nri.Ui.ClickableSvg.V1 exposing
    ( button, link
    , Attribute
    , onClick
    , href, linkSpa, linkExternal, linkWithMethod, linkWithTracking, linkExternalWithTracking
    , width, height
    , disabled
    , withBorder
    , primary, secondary, danger, dangerSecondary
    , custom, css
    , withTooltipAbove, withTooltipBelow
    )

{-|


# Post-release patches

  - uses ClickableAttributes
  - adds tooltip helpers


# Create a button or link

@docs button, link
@docs Attribute


## Behavior

@docs onClick
@docs href, linkSpa, linkExternal, linkWithMethod, linkWithTracking, linkExternalWithTracking


## Sizing

@docs width, height


## State

@docs disabled


## Customization

@docs withBorder
@docs primary, secondary, danger, dangerSecondary

@docs custom, css


## Tooltips

@docs withTooltipAbove, withTooltipBelow

-}

import Accessibility.Styled.Widget as Widget
import ClickableAttributes exposing (ClickableAttributes)
import Css exposing (Color, Style)
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Attributes
import Nri.Ui.Colors.V1 as Colors
import Nri.Ui.Svg.V1 as Svg exposing (Svg)
import Nri.Ui.Tooltip.V1 as Tooltip exposing (Tooltip)


{-| -}
type Attribute msg
    = Attribute (ButtonOrLink msg -> ButtonOrLink msg)


{-| -}
button : String -> Svg -> List (Attribute msg) -> Html msg
button name icon attributes =
    attributes
        |> List.foldl (\(Attribute attribute) b -> attribute b) (build name icon)
        |> renderButton


{-| -}
link : String -> Svg -> List (Attribute msg) -> Html msg
link name icon attributes =
    attributes
        |> List.foldl (\(Attribute attribute) b -> attribute b) (build name icon)
        |> renderLink



-- LINKING, CLICKING, and TRACKING BEHAVIOR


setClickableAttributes :
    (ClickableAttributes msg -> ClickableAttributes msg)
    -> Attribute msg
setClickableAttributes apply =
    set
        (\attributes ->
            { attributes | clickableAttributes = apply attributes.clickableAttributes }
        )


{-| -}
onClick : msg -> Attribute msg
onClick msg =
    setClickableAttributes (ClickableAttributes.onClick msg)


{-| -}
href : String -> Attribute msg
href url =
    setClickableAttributes (ClickableAttributes.href url)


{-| Use this link for routing within a single page app.

This will make a normal <a> tag, but change the Events.onClick behavior to avoid reloading the page.

See <https://github.com/elm-lang/html/issues/110> for details on this implementation.

-}
linkSpa : String -> Attribute msg
linkSpa url =
    setClickableAttributes (ClickableAttributes.linkSpa url)


{-| -}
linkWithMethod : { method : String, url : String } -> Attribute msg
linkWithMethod config =
    setClickableAttributes (ClickableAttributes.linkWithMethod config)


{-| -}
linkWithTracking : { track : msg, url : String } -> Attribute msg
linkWithTracking config =
    setClickableAttributes (ClickableAttributes.linkWithTracking config)


{-| -}
linkExternal : String -> Attribute msg
linkExternal url =
    setClickableAttributes (ClickableAttributes.linkExternal url)


{-| -}
linkExternalWithTracking : { track : msg, url : String } -> Attribute msg
linkExternalWithTracking config =
    setClickableAttributes (ClickableAttributes.linkExternalWithTracking config)



-- SIZING


{-| Default width is 17px.

Note: changing this width will change the width of the icon. The button or link
may be wider if you add a border or margin to it.

-}
width : Css.Px -> Attribute msg
width px =
    set (\attributes -> { attributes | width = px })


{-| Default height is 17px.

Note: changing this height will change the height of the icon. The button or link
may be taller if you add a border or margin to it.

-}
height : Css.Px -> Attribute msg
height px =
    set (\attributes -> { attributes | height = px })



-- STATE


{-| -}
disabled : Bool -> Attribute msg
disabled disabled_ =
    set (\attributes -> { attributes | disabled = disabled_ })



-- CUSTOMIZATION


{-| Display a border around the icon.
-}
withBorder : Attribute msg
withBorder =
    set (\config -> { config | hasBorder = True })


type Theme
    = Primary
    | Secondary
    | Danger
    | DangerSecondary


type alias AppliedTheme =
    { main_ : Color
    , mainHovered : Color
    , background : Color
    , backgroundHovered : Color
    }


disabledTheme : AppliedTheme
disabledTheme =
    { main_ = Colors.gray75
    , mainHovered = Colors.gray75
    , background = Colors.white
    , backgroundHovered = Colors.white
    }


applyTheme : Theme -> AppliedTheme
applyTheme theme =
    case theme of
        Primary ->
            { main_ = Colors.white
            , mainHovered = Colors.white
            , background = Colors.azure
            , backgroundHovered = Colors.azureDark
            }

        Secondary ->
            { main_ = Colors.azure
            , mainHovered = Colors.azureDark
            , background = Colors.white
            , backgroundHovered = Colors.glacier
            }

        Danger ->
            { main_ = Colors.white
            , mainHovered = Colors.white
            , background = Colors.red
            , backgroundHovered = Colors.redDark
            }

        DangerSecondary ->
            { main_ = Colors.red
            , mainHovered = Colors.redDark
            , background = Colors.white
            , backgroundHovered = Colors.redLight
            }


{-| white/transparent icon on an azure background.
-}
primary : Attribute msg
primary =
    set (\attributes -> { attributes | theme = Primary })


{-| This is the default: a blue icon on a transparent background, or a blue icon
on a white/glacier icon with a blue border.
-}
secondary : Attribute msg
secondary =
    set (\attributes -> { attributes | theme = Secondary })


{-| White/transparent icon on a red background.
-}
danger : Attribute msg
danger =
    set (\attributes -> { attributes | theme = Danger })


{-| Red icon on a white/transparent background.
-}
dangerSecondary : Attribute msg
dangerSecondary =
    set (\attributes -> { attributes | theme = DangerSecondary })


{-| Use this helper to add custom attributes.

Do NOT use this helper to add css styles, as they may not be applied the way
you want/expect if underlying Button styles change.
Instead, please use the `css` helper.

-}
custom : List (Html.Attribute msg) -> Attribute msg
custom attributes =
    set
        (\config ->
            { config
                | customAttributes = List.append config.customAttributes attributes
            }
        )


{-| -}
css : List Style -> Attribute msg
css styles =
    set
        (\config ->
            { config
                | customStyles = List.append config.customStyles styles
            }
        )



-- TOOLTIPS


type alias TooltipSettings msg =
    { position : Tooltip.Position
    , isOpen : Bool
    , onShow : Bool -> msg
    , id : String
    }


showTooltip : String -> Maybe (TooltipSettings msg) -> Html msg -> Html msg
showTooltip label maybeSettings buttonOrLink =
    case maybeSettings of
        Just { position, onShow, isOpen, id } ->
            let
                tooltipSettings =
                    { trigger = Tooltip.OnHover
                    , onTrigger = onShow
                    , isOpen = isOpen
                    , triggerHtml = buttonOrLink
                    , extraButtonAttrs = []
                    , id = id ++ "__clickable-svg-tooltip"
                    }
            in
            Tooltip.tooltip [ Html.text label ]
                |> Tooltip.withPosition position
                |> Tooltip.withWidth Tooltip.FitToContent
                |> Tooltip.withPadding Tooltip.SmallPadding
                |> Tooltip.primaryLabel tooltipSettings

        Nothing ->
            buttonOrLink


withTooltip : Tooltip.Position -> { id : String, isOpen : Bool, onShow : Bool -> msg } -> Attribute msg
withTooltip position { id, isOpen, onShow } =
    set
        (\config ->
            { config
                | tooltip =
                    Just { position = position, id = id, isOpen = isOpen, onShow = onShow }
            }
        )


{-| DEPRECATED: prefer to use the Tooltip module directly.
-}
withTooltipAbove : { id : String, isOpen : Bool, onShow : Bool -> msg } -> Attribute msg
withTooltipAbove =
    withTooltip Tooltip.OnTop


{-| DEPRECATED: prefer to use the Tooltip module directly.
-}
withTooltipBelow : { id : String, isOpen : Bool, onShow : Bool -> msg } -> Attribute msg
withTooltipBelow =
    withTooltip Tooltip.OnBottom



-- INTERNALS


set :
    (ButtonOrLinkAttributes msg -> ButtonOrLinkAttributes msg)
    -> Attribute msg
set with =
    Attribute (\(ButtonOrLink config) -> ButtonOrLink (with config))


build : String -> Svg -> ButtonOrLink msg
build label icon =
    ButtonOrLink
        { clickableAttributes = ClickableAttributes.init
        , label = label
        , icon = icon
        , height = Css.px 17
        , width = Css.px 17
        , disabled = False
        , customAttributes = []
        , customStyles = []
        , tooltip = Nothing
        , hasBorder = False
        , theme = Secondary
        }


type ButtonOrLink msg
    = ButtonOrLink (ButtonOrLinkAttributes msg)


type alias ButtonOrLinkAttributes msg =
    { clickableAttributes : ClickableAttributes msg
    , label : String
    , icon : Svg
    , height : Css.Px
    , width : Css.Px
    , disabled : Bool
    , customAttributes : List (Html.Attribute msg)
    , customStyles : List Style
    , tooltip : Maybe (TooltipSettings msg)
    , hasBorder : Bool
    , theme : Theme
    }


renderButton : ButtonOrLink msg -> Html msg
renderButton ((ButtonOrLink config) as button_) =
    Html.button
        ([ Attributes.class "Nri-Ui-Clickable-Svg-V1__button"
         , Attributes.type_ "button"
         , Attributes.css (buttonOrLinkStyles config ++ config.customStyles)
         , Attributes.disabled config.disabled
         , Widget.label config.label
         ]
            ++ ClickableAttributes.toButtonAttributes config.clickableAttributes
            ++ config.customAttributes
        )
        [ renderIcon config
        ]
        |> showTooltip config.label config.tooltip


type Link
    = Default
    | WithTracking
    | SinglePageApp
    | WithMethod String
    | External
    | ExternalWithTracking


renderLink : ButtonOrLink msg -> Html msg
renderLink ((ButtonOrLink config) as link_) =
    let
        ( linkFunctionName, extraAttrs ) =
            ClickableAttributes.toLinkAttributes config.clickableAttributes
    in
    Html.a
        ([ Attributes.class ("Nri-Ui-Clickable-Svg-" ++ linkFunctionName)
         , Attributes.css (buttonOrLinkStyles config ++ config.customStyles)
         , Widget.disabled config.disabled
         , Widget.label config.label
         ]
            ++ (if not config.disabled then
                    extraAttrs

                else
                    []
               )
            ++ config.customAttributes
        )
        [ renderIcon config
        ]
        |> showTooltip config.label config.tooltip


renderIcon : ButtonOrLinkAttributes msg -> Html msg
renderIcon config =
    config.icon
        |> Svg.withCss
            (if config.hasBorder then
                [ Css.width
                    (Css.calc config.width
                        Css.minus
                        (Css.px <|
                            (2 * withBorderHorizontalPadding)
                                + withBorderLeftBorderWidth
                                + withBorderRightBorderWidth
                        )
                    )
                , Css.height
                    (Css.calc config.height
                        Css.minus
                        (Css.px <|
                            withBorderTopPadding
                                + withBorderBottomPadding
                                + withBorderTopBorderWidth
                                + withBorderBottomBorderWidth
                        )
                    )
                ]

             else
                [ Css.width config.width
                , Css.height config.height
                ]
            )
        |> Svg.toHtml


buttonOrLinkStyles : ButtonOrLinkAttributes msg -> List Style
buttonOrLinkStyles config =
    let
        ( { main_, mainHovered, background, backgroundHovered }, cursor ) =
            if config.disabled then
                ( disabledTheme, Css.notAllowed )

            else
                ( applyTheme config.theme, Css.pointer )
    in
    [ Css.property "transition"
        "background-color 0.2s, color 0.2s, border-width 0s, border-color 0.2s"

    -- Colors, text decoration, cursor
    , Css.textDecoration Css.none
    , Css.color main_
    , Css.visited [ Css.color main_ ]
    , Css.hover
        [ Css.textDecoration Css.none
        , Css.color mainHovered
        , Css.cursor cursor
        ]

    -- Margins, borders, padding
    , Css.margin Css.zero
    , Css.textAlign Css.center
    , Css.batch <|
        if config.hasBorder then
            [ Css.borderRadius (Css.px 8)
            , Css.borderColor main_
            , Css.borderStyle Css.solid
            , Css.borderTopWidth (Css.px withBorderTopBorderWidth)
            , Css.borderRightWidth (Css.px withBorderRightBorderWidth)
            , Css.borderBottomWidth (Css.px withBorderBottomBorderWidth)
            , Css.borderLeftWidth (Css.px withBorderLeftBorderWidth)
            , Css.backgroundColor background
            , Css.hover
                [ Css.borderColor mainHovered
                , Css.backgroundColor backgroundHovered
                ]
            , Css.padding3
                (Css.px withBorderTopPadding)
                (Css.px withBorderHorizontalPadding)
                (Css.px withBorderBottomPadding)
            ]

        else
            [ Css.borderWidth Css.zero
            , Css.padding Css.zero
            , Css.backgroundColor Css.transparent
            ]

    -- Sizing
    , Css.display Css.inlineBlock
    , Css.boxSizing Css.borderBox
    , Css.width config.width
    , Css.height config.height
    , Css.lineHeight (Css.num 1)
    ]


withBorderTopBorderWidth : Float
withBorderTopBorderWidth =
    1


withBorderRightBorderWidth : Float
withBorderRightBorderWidth =
    1


withBorderBottomBorderWidth : Float
withBorderBottomBorderWidth =
    2


withBorderLeftBorderWidth : Float
withBorderLeftBorderWidth =
    1


withBorderTopPadding : Float
withBorderTopPadding =
    4


withBorderBottomPadding : Float
withBorderBottomPadding =
    3


withBorderHorizontalPadding : Float
withBorderHorizontalPadding =
    5
