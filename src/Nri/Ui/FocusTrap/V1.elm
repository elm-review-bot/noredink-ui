module Nri.Ui.FocusTrap.V1 exposing
    ( first, last
    , only
    , FocusTrap(..), toAttribute
    )

{-| Create a focus trap.

@docs first, last
@docs only

-}

import Accessibility.Styled as Html exposing (..)
import Accessibility.Styled.Key as Key
import Browser.Dom as Dom
import Browser.Events
import Html.Styled.Attributes as Attributes exposing (class, id)
import Html.Styled.Events as Events exposing (onClick)
import Json.Decode as Decode exposing (Decoder)
import Task


type FocusTrap
    = MultipleElements { firstId : String, lastId : String }
    | OneElement { id : String }


toAttribute : (String -> msg) -> FocusTrap -> Html.Attribute msg
toAttribute focus trap =
    onTab <|
        \elementId shiftKey ->
            case trap of
                OneElement { id } ->
                    Decode.succeed
                        { message = focus id
                        , preventDefault = True
                        , stopPropagation = False
                        }

                MultipleElements { firstId, lastId } ->
                    -- if the user tabs back while on the first id,
                    -- we want to wrap around to the last id.
                    if elementId == firstId && shiftKey then
                        Decode.succeed
                            { message = focus lastId
                            , preventDefault = True
                            , stopPropagation = False
                            }

                    else if elementId == lastId && not shiftKey then
                        -- if the user tabs forward while on the last id,
                        -- we want to wrap around to the first id.
                        Decode.succeed
                            { message = focus firstId

                            -- Will this preventDefault break anything
                            -- if the element is an input
                            -- or dropdown (if the element has key-based
                            -- behavior already)?
                            , preventDefault = True
                            , stopPropagation = False
                            }

                    else
                        Decode.fail "No need to intercept the key press"


onTab do =
    Events.custom "keydown"
        (Decode.andThen
            (\( id, keyCode, shiftKey ) ->
                if keyCode == 9 then
                    do id shiftKey

                else
                    Decode.fail "No need to intercept the key press"
            )
            decodeKeydown
        )


decodeKeydown =
    Decode.map3 (\id keyCode shiftKey -> ( id, keyCode, shiftKey ))
        (Decode.at [ "target", "id" ] Decode.string)
        (Decode.field "keyCode" Decode.int)
        (Decode.field "shiftKey" Decode.bool)


{-| -}
only : { focusSelf : msg } -> List (Html.Attribute msg)
only { focusSelf } =
    [ onKeyDownPreventDefault
        [ Key.tab focusSelf
        , Key.tabBack focusSelf
        ]
    , class "focus-trap__only-focusable-element"
    ]


{-| -}
first : { focusLastId : msg } -> List (Html.Attribute msg)
first { focusLastId } =
    [ onKeyDownPreventDefault [ Key.tabBack focusLastId ]
    , class "focus-trap__first-focusable-element"
    ]


{-| -}
last : { focusFirstId : msg } -> List (Html.Attribute msg)
last { focusFirstId } =
    [ onKeyDownPreventDefault [ Key.tab focusFirstId ]
    , class "focus-trap__last-focusable-element"
    ]


onKeyDownPreventDefault : List (Decoder msg) -> Html.Attribute msg
onKeyDownPreventDefault decoders =
    Events.preventDefaultOn "keydown"
        (Decode.oneOf (List.map (Decode.map (\msg -> ( msg, True ))) decoders))
