module Material.Snackbar exposing
    ( Property
    , view
    , leading
    , dismissible
    , Contents
    , add
    , toast
    , snack
    )

{-| Snackbars provide brief messages about app processes at the bottom of the screen.


# Resources

  - [Material Design guidelines: Snackbars & toasts](https://material.io/guidelines/components/snackbars-toasts.html)
  - [Demo](https://aforemny.github.io/elm-mdc/#snackbar)


# Example

Put the snackbar in your main content, so it's available to display
when needed. It's invisible by default.

    import Material.Snackbar as Snackbar

    Snackbar.view Mdc "my-snackbar" model.mdc [] []

You would then need to show it in your update action.

Sketch of the code (see the Demo for more details):

    update msg model =
            Login (Err _) ->
                let
                    contents =
                        Snackbar.toast Nothing "Login failed"
                    ( mdc, effects ) =
                        Snackbar.add Mdc "my-snackbar" contents model.mdc
                in
                    ( { model | state = LoginFailed, mdc = mdc }, effects )

This would display a message without an action.


# Usage

@docs Property
@docs view
@docs leading
@docs dismissible


## Contents

@docs Contents
@docs add
@docs toast
@docs snack

-}

import Html exposing (Html)
import Internal.Snackbar.Implementation as Snackbar
import Material


{-| Snackbar property.
-}
type alias Property m =
    Snackbar.Property m


{-| Snackbar view.
-}
view :
    (Material.Msg m -> m)
    -> Material.Index
    -> Material.Model m
    -> List (Property m)
    -> List (Html m)
    -> Html m
view =
    Snackbar.view


{-| Snackbar Contents.
-}
type alias Contents m =
    { message : String
    , action : Maybe String
    , timeout : Float
    , fade : Float
    , stacked : Bool
    , dismissOnAction : Bool
    , onDismiss : Maybe m
    }


{-| Generate toast with given message. Timeout is 2750ms, fade 250ms.
-}
toast : Maybe m -> String -> Contents m
toast =
    Snackbar.toast


{-| Generate snack with given message and label.
Timeout is 2750ms, fade 250ms.
-}
snack : Maybe m -> String -> String -> Contents m
snack =
    Snackbar.snack


{-| Add a message to the snackbar. If another message is currently displayed,
the provided message will be queued.
-}
add :
    (Material.Msg m -> m)
    -> Material.Index
    -> Contents m
    -> Material.Model m
    -> ( Material.Model m, Cmd m )
add =
    Snackbar.add


{-| Optional. The dismiss (“X”) icon.
-}
dismissible : Property m
dismissible =
    Snackbar.dismissible


{-| Optional. Positions the snackbar on the leading edge of the screen
(left in LTR, right in RTL) instead of centered.
-}
leading : Property m
leading =
    Snackbar.leading
