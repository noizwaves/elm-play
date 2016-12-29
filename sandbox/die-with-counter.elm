import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Random

main =
    Html.program { init = init, view = view, update = update, subscriptions = subscriptions }



-- MODEL

type alias Model =
  { dieFace : Int
  , rolls: Int
  }


-- UPDATE

type Msg
  = Roll
  | NewFace Int

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Roll -> ({ model | rolls = model.rolls + 1 }, Random.generate NewFace (Random.int 1 6))
    NewFace face -> ({ model | dieFace = face }, Cmd.none)



-- VIEW

view : Model -> Html Msg
view model =
  div []
    [ div [] [ text ("Die Face: " ++ (toString model.dieFace)) ]
    , div [] [ text ("Rolls: " ++ (toString model.rolls)) ]
    , div [] [ button [onClick Roll] [text "Roll die"] ]
    ]

-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none


-- INIT

init : (Model, Cmd Msg)
init = (Model 1 0, Cmd.none)
