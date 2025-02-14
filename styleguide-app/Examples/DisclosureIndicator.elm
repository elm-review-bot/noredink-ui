module Examples.DisclosureIndicator exposing (Msg, State, example)

{-|

@docs Msg, State, example

-}

import AtomicDesignType exposing (AtomicDesignType(..))
import Category exposing (Category(..))
import Css
import Example exposing (Example)
import Html.Styled as Html
import Html.Styled.Attributes exposing (css)
import Html.Styled.Events exposing (onClick)
import KeyboardSupport exposing (Direction(..), Key(..))
import Nri.Ui.Button.V10 as Button
import Nri.Ui.Colors.V1 as Colors
import Nri.Ui.DisclosureIndicator.V2 as DisclosureIndicator
import Nri.Ui.Text.V2 as Text


{-| -}
type alias State =
    { largeState : Bool
    , mediumState : Bool
    }


{-| -}
example : Example State Msg
example =
    { name = "DisclosureIndicator"
    , version = 2
    , categories = [ Widgets ]
    , atomicDesignType = Atom
    , keyboardSupport = []
    , state = init
    , update = update
    , subscriptions = \_ -> Sub.none
    , view =
        \state ->
            [ Text.smallBodyGray [ Html.text "The disclosure indicator is only the caret. It is NOT a button -- you must create a button or clickabletext yourself!" ]
            , Html.div [ css [ Css.displayFlex, Css.padding (Css.px 8) ] ]
                [ Button.button "Toggle large indicator"
                    [ Button.onClick ToggleLarge, Button.small, Button.secondary ]
                , Button.button "Toggle medium indicator"
                    [ Button.onClick ToggleMedium, Button.small, Button.secondary ]
                ]
            , Html.div [ css [ Css.displayFlex, Css.alignItems Css.center, Css.marginBottom (Css.px 8) ] ]
                [ DisclosureIndicator.large [ Css.marginRight (Css.px 10) ] state.largeState
                , Html.text "I'm a 17px caret icon."
                ]
            , Html.div [ css [ Css.displayFlex, Css.alignItems Css.center, Css.marginBottom (Css.px 8) ] ]
                [ DisclosureIndicator.medium [ Css.paddingRight (Css.px 8) ] state.mediumState
                , Html.text "I'm a 15px caret icon."
                ]
            ]
    }


{-| -}
init : State
init =
    { largeState = False
    , mediumState = False
    }


{-| -}
type Msg
    = ToggleLarge
    | ToggleMedium


{-| -}
update : Msg -> State -> ( State, Cmd Msg )
update msg state =
    case msg of
        ToggleLarge ->
            ( { state | largeState = not state.largeState }, Cmd.none )

        ToggleMedium ->
            ( { state | mediumState = not state.mediumState }, Cmd.none )
