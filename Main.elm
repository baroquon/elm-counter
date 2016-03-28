import Html exposing (..)
import StartApp.Simple exposing (start)
import Html.Events exposing (onClick)

type alias Model =
  { count : Int
  , dec   : Int
  , inc   : Int
  }

type Action = Increment | Decrement

update : Action -> Model -> Model
update action model =
  case action of
    Increment -> { count = model.count + 1, dec = model.dec, inc = model.inc + 1 }
    Decrement -> { count = model.count - 1, dec = model.dec + 1, inc = model.inc }

view : Signal.Address Action -> Model -> Html
view address model =
  div []
  [ button [ onClick address Decrement ] [ text "-" ]
  , div [] [text (toString model.count)]
  , button [ onClick address Increment ] [ text "+" ]
  , h3 [] [ text "Increment Clicked "
    , text (toString model.inc)
    ]
  , h3 [] [ text "Decrement Clicked "
    , text (toString model.dec)
    ]
  ]

main =
  start { model = { count = 0, dec = 0, inc = 0 }, update = update, view = view }
