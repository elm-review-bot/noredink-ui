module Nri.Ui.Modal.V10 exposing
    ( Model, init, initOpen, isOpen
    , Msg, open, close, update, subscriptions
    , Attribute, hideTitle, css
    , FocusManager(..), info, warning
    )

{-| Changes from V9:

  - adds hideTitle and css helpers

@docs Model, init, initOpen, isOpen
@docs Msg, open, close, update, subscriptions
@docs Attribute, hideTitle, css
@docs FocusManager, info, warning

    import Html.Styled exposing (text)
    import Nri.Ui.Modal.V10 as Modal

    type Msg
        = ModalMsg Modal.Msg

    ...

    viewModal : Modal.Model -> Html Msg
    viewModal modalState =
        Modal.info
            { title = "Modal Title"
            , wrapMsg = ModalMsg
            , focusManager =
                Modal.OneFocusableElement
                    (\{ onlyFocusableElement, closeButton } ->
                        { content =
                            [ closeButton onlyFocusableElement
                            , text "Modal Content"
                            ]
                        , footer = []
                        }
                    )
            }
            [ Modal.hideTitle
            , Modal.css [ padding (px 10) ]
            ]
            modalState

-}

import Accessibility.Styled as Html exposing (..)
import Accessibility.Styled.Aria as Aria
import Accessibility.Styled.Key as Key
import Accessibility.Styled.Role as Role
import Accessibility.Styled.Widget as Widget
import Browser
import Browser.Dom as Dom
import Browser.Events
import Color.Transparent as Transparent
import Css exposing (..)
import Css.Transitions
import Html.Styled as Root
import Html.Styled.Attributes as Attrs exposing (id)
import Html.Styled.Events exposing (onClick)
import Nri.Ui.Colors.Extra
import Nri.Ui.Colors.V1 as Colors
import Nri.Ui.Fonts.V1 as Fonts
import Nri.Ui.SpriteSheet
import Nri.Ui.Svg.V1
import Task


{-| -}
type Model
    = Opened String
    | Closed


{-| -}
init : Model
init =
    Closed


{-| Pass the id of the element that should receive focus when the modal is closed.
-}
initOpen : String -> Model
initOpen =
    Opened


{-| -}
isOpen : Model -> Bool
isOpen model =
    case model of
        Opened _ ->
            True

        Closed ->
            False


type By
    = EscapeKey
    | OverlayClick
    | Other


{-| -}
type Msg
    = OpenModal String
    | CloseModal By
    | Focus String
    | Focused (Result Dom.Error ())


{-| Include the subscription if you want the modal to dismiss on `Esc`.
-}
subscriptions : Model -> Sub Msg
subscriptions model =
    case model of
        Opened _ ->
            Browser.Events.onKeyDown (Key.escape (CloseModal EscapeKey))

        Closed ->
            Sub.none


{-| -}
update : { dismissOnEscAndOverlayClick : Bool } -> Msg -> Model -> ( Model, Cmd Msg )
update { dismissOnEscAndOverlayClick } msg model =
    case msg of
        OpenModal returnFocusTo ->
            ( Opened returnFocusTo
            , Dom.focus autofocusId
                |> Task.onError (\_ -> Dom.focus firstId)
                |> Task.attempt Focused
            )

        CloseModal by ->
            let
                closeModal returnFocusTo =
                    ( Closed, Task.attempt Focused (Dom.focus returnFocusTo) )
            in
            case ( model, by, dismissOnEscAndOverlayClick ) of
                ( Opened returnFocusTo, _, True ) ->
                    closeModal returnFocusTo

                ( Opened returnFocusTo, Other, False ) ->
                    closeModal returnFocusTo

                _ ->
                    ( model, Cmd.none )

        Focus id ->
            ( model, Task.attempt Focused (Dom.focus id) )

        Focused _ ->
            -- TODO: consider adding error handling when we didn't successfully
            -- fous an element
            ( model, Cmd.none )


type Autofocus
    = Default
    | Last


{-| Pass the id of the element that should receive focus when the modal closes.
-}
open : String -> Msg
open =
    OpenModal


{-| -}
close : Msg
close =
    CloseModal Other



-- ATTRIBUTES


{-| Modals should allow the user to tab forwards & backwards through the modal content.
The user should never find their Focus lost behind the modal backdrop!

Use the `FocusManager` to tag the focusable elements in your modal, so that we
know to which element to return focus when the user reaches the last focusable element.

-}
type FocusManager msg
    = MultipleFocusableElements
        ({ firstFocusableElement : List (Html.Attribute msg)
         , lastFocusableElement : List (Html.Attribute msg)
         , autofocusElement : Html.Attribute msg
         , closeButton : List (Html.Attribute msg) -> Html msg
         }
         ->
            { content : List (Html msg)
            , footer : List (Html msg)
            }
        )
    | OneFocusableElement
        ({ onlyFocusableElement : List (Html.Attribute msg)
         , closeButton : List (Html.Attribute msg) -> Html msg
         }
         ->
            { content : List (Html msg)
            , footer : List (Html msg)
            }
        )


{-| -}
type Attribute
    = Attribute (Attributes -> Attributes)


type alias Attributes =
    { overlayColor : Color
    , titleColor : Color
    , visibleTitle : Bool
    , titleStyles : List Style
    , customStyles : List Style
    }


defaultAttributes : Attributes
defaultAttributes =
    { overlayColor = Nri.Ui.Colors.Extra.withAlpha 0.9 Colors.navy
    , titleColor = Colors.navy
    , visibleTitle = True
    , titleStyles = []
    , customStyles = []
    }


{-| -}
hideTitle : Attribute
hideTitle =
    Attribute (\attrs -> { attrs | visibleTitle = False })


{-| -}
css : List Style -> Attribute
css styles =
    Attribute
        (\attrs ->
            { attrs
                | customStyles =
                    List.append attrs.customStyles styles
            }
        )


titleColor : Color -> Attribute
titleColor color =
    Attribute
        (\attrs -> { attrs | titleColor = color })


overlayColor : Color -> Attribute
overlayColor color =
    Attribute
        (\attrs -> { attrs | overlayColor = color })


buildAttributes : List Attribute -> Attributes -> Attributes
buildAttributes attrs initial =
    let
        result =
            attrs
                |> List.foldl (\(Attribute fun) acc -> fun acc) initial
    in
    { result | titleStyles = titleStyles result.titleColor result.visibleTitle }


modalStyles : List Style
modalStyles =
    [ position relative

    -- Border
    , borderRadius (px 20)
    , boxShadow5 zero (px 1) (px 10) zero (rgba 0 0 0 0.35)

    -- Spacing
    , margin2 (px 50) auto

    -- Size
    , minHeight (vh 40)
    , width (px 600)
    , backgroundColor Colors.white

    -- the modal should grow up to the viewport minus a 50px margin
    , maxHeight (calc (pct 100) minus (px 100))
    ]


titleStyles : Color -> Bool -> List Style
titleStyles color visibleTitle =
    if visibleTitle then
        [ Fonts.baseFont
        , Css.fontWeight (Css.int 700)
        , Css.paddingTop (Css.px 40)
        , Css.paddingBottom (Css.px 20)
        , Css.margin Css.zero
        , Css.fontSize (Css.px 20)
        , Css.textAlign Css.center
        , Css.color color
        ]

    else
        [ -- https://snook.ca/archives/html_and_css/hiding-content-for-accessibility
          Css.property "clip" "rect(1px, 1px, 1px, 1px)"
        , Css.position Css.absolute
        , Css.height (Css.px 1)
        , Css.width (Css.px 1)
        , Css.overflow Css.hidden
        , Css.margin (Css.px -1)
        , Css.padding Css.zero
        , Css.border Css.zero
        ]



-- VIEW


{-| -}
info :
    { title : String
    , wrapMsg : Msg -> msg
    , focusManager : FocusManager msg
    }
    -> List Attribute
    -> Model
    -> Html msg
info config attrsList =
    view config attrsList


{-| -}
warning :
    { title : String
    , wrapMsg : Msg -> msg
    , focusManager : FocusManager msg
    }
    -> List Attribute
    -> Model
    -> Html msg
warning config attrsList =
    view config
        (List.append
            [ overlayColor (Nri.Ui.Colors.Extra.withAlpha 0.9 Colors.gray20)
            , titleColor Colors.red
            ]
            attrsList
        )


view :
    { title : String
    , wrapMsg : Msg -> msg
    , focusManager : FocusManager msg
    }
    -> List Attribute
    -> Model
    -> Html msg
view config attrsList model =
    let
        attrs =
            buildAttributes attrsList defaultAttributes
    in
    case model of
        Opened _ ->
            div
                [ Attrs.css
                    [ position fixed
                    , top zero
                    , left zero
                    , width (pct 100)
                    , height (pct 100)
                    , displayFlex
                    , alignItems center
                    ]
                ]
                [ viewBackdrop config.wrapMsg attrs.overlayColor
                , div [ Attrs.css (List.append modalStyles attrs.customStyles) ] [ viewModal config attrs ]
                , Root.node "style" [] [ Root.text "body {overflow: hidden;} " ]
                ]
                |> List.singleton
                |> div [ Attrs.css [ Css.position Css.relative, Css.zIndex (Css.int 1) ] ]

        Closed ->
            text ""


viewBackdrop : (Msg -> msg) -> Color -> Html msg
viewBackdrop wrapMsg color =
    Root.div
        -- We use Root html here in order to allow clicking to exit out of
        -- the overlay. This behavior is available to non-mouse users as
        -- well via the ESC key, so imo it's fine to have this div
        -- be clickable but not focusable.
        [ Attrs.css
            [ position absolute
            , width (pct 100)
            , height (pct 100)
            , backgroundColor color
            ]
        , onClick (wrapMsg (CloseModal OverlayClick))
        ]
        []


viewModal :
    { title : String
    , wrapMsg : Msg -> msg
    , focusManager : FocusManager msg
    }
    ->
        { a
            | visibleTitle : Bool
            , titleStyles : List Style
        }
    -> Html msg
viewModal config styles =
    section
        [ Role.dialog
        , Aria.labeledBy modalTitleId
        ]
        [ h1 [ id modalTitleId, Attrs.css styles.titleStyles ] [ text config.title ]
        , viewContent styles.visibleTitle <|
            case config.focusManager of
                OneFocusableElement toContentAndFooter ->
                    toContentAndFooter
                        { onlyFocusableElement =
                            List.map (Attrs.map config.wrapMsg)
                                [ Key.onKeyDown
                                    [ Key.tabBack (Focus autofocusId)
                                    , Key.tab (Focus autofocusId)
                                    ]
                                , id autofocusId
                                ]
                        , closeButton = closeButton config.wrapMsg
                        }

                MultipleFocusableElements toContentAndFooter ->
                    toContentAndFooter
                        { firstFocusableElement =
                            List.map (Attrs.map config.wrapMsg)
                                [ Key.onKeyDown [ Key.tabBack (Focus lastId) ]
                                , id firstId
                                ]
                        , lastFocusableElement =
                            List.map (Attrs.map config.wrapMsg)
                                [ Key.onKeyDown [ Key.tab (Focus firstId) ]
                                , id lastId
                                ]
                        , autofocusElement =
                            Attrs.map config.wrapMsg (id autofocusId)
                        , closeButton = closeButton config.wrapMsg
                        }
        ]


{-| -}
viewContent : Bool -> { content : List (Html msg), footer : List (Html msg) } -> Html msg
viewContent visibleTitle { content, footer } =
    div []
        [ viewInnerContent content visibleTitle (not (List.isEmpty footer))
        , viewFooter footer
        ]


{-| -}
viewInnerContent : List (Html msg) -> Bool -> Bool -> Html msg
viewInnerContent children visibleTitle visibleFooter =
    let
        titleHeight =
            if visibleTitle then
                45

            else
                0

        footerHeight =
            if visibleFooter then
                180

            else
                0

        modalTitleStyles =
            if visibleTitle then
                []

            else
                [ Css.borderTopLeftRadius (Css.px 20)
                , Css.borderTopRightRadius (Css.px 20)
                , Css.overflowY Css.hidden
                ]

        modalFooterStyles =
            if visibleFooter then
                []

            else
                [ Css.borderBottomLeftRadius (Css.px 20)
                , Css.borderBottomRightRadius (Css.px 20)
                , Css.overflowY Css.hidden
                ]
    in
    div
        [ Attrs.css (modalTitleStyles ++ modalFooterStyles)
        ]
        [ div
            [ Attrs.css
                [ Css.overflowY Css.auto
                , Css.overflowX Css.hidden
                , Css.minHeight (Css.px 150)
                , Css.maxHeight
                    (Css.calc (Css.vh 100)
                        Css.minus
                        (Css.px (footerHeight + titleHeight + 145))
                    )
                , Css.width (Css.pct 100)
                , Css.boxSizing Css.borderBox
                , Css.paddingLeft (Css.px 40)
                , Css.paddingRight (Css.px 40)
                , if visibleTitle then
                    Css.paddingTop Css.zero

                  else
                    Css.paddingTop (Css.px 40)
                , if visibleFooter then
                    Css.paddingBottom Css.zero

                  else
                    Css.paddingBottom (Css.px 40)
                , if visibleFooter then
                    shadow (Transparent.customOpacity 0.15) (Css.px 16)

                  else
                    shadow (Transparent.customOpacity 0.4) (Css.px 30)
                ]
            ]
            children
        ]


shadow : Transparent.Opacity -> Css.Px -> Css.Style
shadow opacity bottomShadowHeight =
    let
        to =
            Transparent.fromRGBA { red = 0, green = 0, blue = 0, alpha = opacity }
                |> Transparent.toRGBAString
    in
    Css.batch
        [ -- Shadows for indicating that the content is scrollable
          [ "/* TOP shadow */"
          , "top linear-gradient(to top, rgb(255, 255, 255), rgb(255, 255, 255)) local,"
          , "top linear-gradient(to top, rgba(255, 255, 255, 0), rgba(0, 0, 0, 0.15)) scroll,"
          , ""
          , "/* BOTTOM shadow */"
          , "bottom linear-gradient(to bottom, rgb(255, 255, 255), rgb(255, 255, 255)) local,"
          , "bottom linear-gradient(to bottom, rgba(255, 255, 255, 0), " ++ to ++ ") scroll"
          ]
            |> String.join "\n"
            |> Css.property "background"
        , Css.backgroundSize2 (Css.pct 100) bottomShadowHeight
        , Css.backgroundRepeat Css.noRepeat
        ]


{-| -}
viewFooter : List (Html msg) -> Html msg
viewFooter children =
    if List.isEmpty children then
        Html.text ""

    else
        div
            [ Attrs.css
                [ Css.alignItems Css.center
                , Css.displayFlex
                , Css.flexDirection Css.column
                , Css.flexGrow (Css.int 2)
                , Css.flexWrap Css.noWrap
                , Css.margin4 (Css.px 20) Css.zero Css.zero Css.zero
                , Css.paddingBottom (Css.px 40)
                , Css.width (Css.pct 100)
                ]
            ]
            children



--BUTTONS


{-| -}
closeButton : (Msg -> msg) -> List (Html.Attribute msg) -> Html msg
closeButton wrapMsg focusableElementAttrs =
    button
        (Widget.label "Close modal"
            :: Attrs.map wrapMsg (onClick close)
            :: Attrs.css
                [ -- in the upper-right corner of the modal
                  Css.position Css.absolute
                , Css.top Css.zero
                , Css.right Css.zero

                -- make the hitspace extend all the way to the corner
                , Css.width (Css.px 40)
                , Css.height (Css.px 40)
                , Css.padding4 (Css.px 20) (Css.px 20) Css.zero Css.zero

                -- apply button styles
                , Css.borderWidth Css.zero
                , Css.backgroundColor Css.transparent
                , Css.cursor Css.pointer
                , Css.color Colors.azure
                , Css.hover [ Css.color Colors.azureDark ]
                , Css.Transitions.transition [ Css.Transitions.color 0.1 ]
                ]
            :: focusableElementAttrs
        )
        [ Nri.Ui.Svg.V1.toHtml Nri.Ui.SpriteSheet.xSvg
        ]



-- IDS


modalTitleId : String
modalTitleId =
    "modal__title"


firstId : String
firstId =
    "modal__first-focusable-element"


lastId : String
lastId =
    "modal__last-focusable-element"


autofocusId : String
autofocusId =
    "modal__autofocus-element"
