import Graphics.Element exposing (..)
import Graphics.Collage exposing (..)
import String
import Mouse

type alias Model = { text: String, x: Int, y: Int }

stateName = "ILLINOIS"
model = { text = stateName, x = 0, y = 0 }

update : (Int, Int) -> Model -> Model
update (x, y) m = 
  let newText = if m.x > 200 then String.reverse stateName else stateName
  in
  { m | x <- x , text <- newText}


render : Model -> Graphics.Element.Element
render model =
  let content rot = [ rotate (degrees (toFloat rot)) (toForm (show model.text))] in
  collage 300 300 (content model.x)

main : Signal Element
main = Signal.map render (Signal.foldp update model Mouse.position)
