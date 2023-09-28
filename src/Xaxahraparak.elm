module Xaxahraparak exposing (..)

import Html exposing (b)



-- Rules
-- - Ոնց կարա գառաժը երեխուն խանգարի
-- - Երեխուն կարա ուրիշ երեխա խանգարի
-- - Երեխուն կարա ուրիշ ավելի մեծ երեխա խանգարի


tbi =
    Debug.todo "to be implemented"


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
            x :: populate (coordinate - 1) occupant xs


populateMany : Coordinate -> List Occupant -> OneDXaxahraparak -> OneDXaxahraparak
populateMany coordinate occupants xaxahraparak =
    case occupants of
        [] ->
            xaxahraparak

        x :: xs ->
            xaxahraparak
                |> populate coordinate x
                >> populateMany coordinate xs


type alias PlanVector =
    Int


move : PlanVector -> Coordinate -> OneDXaxahraparak -> OneDXaxahraparak
move planVector coordinate xaxahraparak =
    let
        occupants =
            occupantsOf coordinate xaxahraparak
    in
    case planVector of
        0 ->
            xaxahraparak

        1 ->
            xaxahraparak |> populateMany (coordinate + 1) occupants >> clear coordinate

        _ ->
            let
                updatedXaxahraparak =
                    xaxahraparak
                        |> populateMany (coordinate + 1) occupants
                        |> clear coordinate
            in
            move (planVector - 1) (coordinate + 1) updatedXaxahraparak


occupantsOf : Coordinate -> OneDXaxahraparak -> List Occupant
occupantsOf coordinate xaxahraparak =
    case ( xaxahraparak, coordinate ) of
        ( [], _ ) ->
            []

        ( x :: _, 0 ) ->
            x.occupants

        ( _ :: xs, n ) ->
            occupantsOf (n - 1) xs


clear : Coordinate -> OneDXaxahraparak -> OneDXaxahraparak
clear coordinate xaxahraparak =
    case ( xaxahraparak, coordinate ) of
        ( [], _ ) ->
            []

        ( x :: xs, 0 ) ->
            { occupants = [], x = x.x } :: xs

        ( x :: xs, _ ) ->
            x :: clear (coordinate - 1) xs



---- >
-- move 1 2 0010 => 0001
-- move 6 1 0100000000
---r----
-- 0123456789
-- -- 3 ->
-- 0. 0100000000
-- 9. 0010000000
-- 4. 0001000000
-- 3. 0000100000
-- 2. 0000010000
-- 1. 0000001000
-- 0. 0000000100
-- 9. 0010000000
-- 4. 0011000000
-- 3. 0011100000
-- 2. 0011110000
-- 1. 0011111000
-- 0. 0011111100
--->
-- move -2 2 0010 => 1000
-- 0010
-- @->-
-- 0    +
-- 000  +
-- 00e  +
-- |-0g0
-- |- 00e -> 0e0
-- type Napravlennost = Horizontal| Vertical
-- type alias Garaj = {position: (Int,Int), napravlennost: Napravlennost, length: Int}
