module Xaxahraparak exposing (..)

-- Rules
-- - Ոնց կարա գառաժը երեխուն խանգարի
-- - Երեխուն կարա ուրիշ երեխա խանգարի
-- - Երեխուն կարա ուրիշ ավելի մեծ երեխա խանգարի


type alias OneDXaxahraparak =
    List OneDYachejka


type alias Coordinate =
    Int


type Occupant
    = Garaj
    | Erexa


type alias OneDYachejka =
    { occupants : List Occupant
    , x : Coordinate
    }


spawn : Int -> OneDXaxahraparak
spawn size =
    List.range 0 (size - 1)
        |> List.map (\coordinate -> { occupants = [], x = coordinate })


populate : Coordinate -> Occupant -> OneDXaxahraparak -> OneDXaxahraparak
populate coordinate occupant xaxahraparak =
    case ( xaxahraparak, coordinate ) of
        ( [], _ ) ->
            []

        ( x :: xs, 0 ) ->
            { occupants = occupant :: x.occupants, x = x.x } :: xs

        ( x :: xs, _ ) ->
            x :: populate (coordinate - 1) occupant  xs



-- @->-
-- 0    +
-- 000  +
-- 00e  +
-- |-0g0
-- |- 00e -> 0e0
-- type Napravlennost = Horizontal| Vertical
-- type alias Garaj = {position: (Int,Int), napravlennost: Napravlennost, length: Int}
