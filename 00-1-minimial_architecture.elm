import Html exposing (..)
import Html.Attributes exposing (..)
--import Html.Events exposing (onInput)

main =
    Html.program { init = init, view = view, update = update, subscriptions = subscriptions }



-- MODEL

type alias Model =
  { state : Int
  }


-- UPDATE

type Msg = ActionOne | ActionTwo

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    ActionOne -> (model, Cmd.none)
    ActionTwo -> (model, Cmd.none)



-- VIEW

view : Model -> Html Msg
view model =
  div [] [ text (toString model.state) ]


-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none


-- INIT

init : (Model, Cmd Msg)
init = (Model 1, Cmd.none)
