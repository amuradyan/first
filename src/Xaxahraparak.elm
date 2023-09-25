module Xaxahraparak exposing (..)

-- Rules

-- - Ոնց կարա գառաժը երեխուն խանգարի
-- - Երեխուն կարա ուրիշ երեխա խանգարի
-- - Երեխուն կարա ուրիշ ավելի մեծ երեխա խանգարի

type alias OneDXaxahraparak = List OneDYachejka
type alias Coordinate = Int
type Occupant = Garaj | Eerexa

type alias OneDYachejka =
  {
    occupant: Maybe Occupant
    , x: Coordinate
  }


spawn: Int -> OneDXaxahraparak
spawn size =
  List.range 0 (size - 1)
  |> List.map (\coordinate -> {occupant = Nothing, x = coordinate})


populate: OneDXaxahraparak -> Coordinate -> Occupant -> OneDXaxahraparak
populate xaxahraparak coordinate occupant = Debug.todo "zangel eiq"

-- 0 +
-- 000
-- 00e
-- |-0g0
-- |- 00e -> 0e0


-- type Napravlennost = Horizontal| Vertical
-- type alias Garaj = {position: (Int,Int), napravlennost: Napravlennost, length: Int}
