module XaxahraparakSpec exposing (..)

import Expect exposing (Expectation)
import Test exposing (..)
import Xaxahraparak exposing (Occupant(..), populate, spawn)


suite : Test
suite =
    let
        pending : () -> Expectation
        pending =
            \() -> Expect.fail "pending"
    in
    describe "Xaxahraparak generation"
        [ test "creating prisitne xaxahraparaks" <|
            \() ->
                let
                    gaugeXaxahraparak =
                        [ { occupants = [], x = 0 }, { occupants = [], x = 1 }, { occupants = [], x = 2 } ]

                    realXaxahraparak =
                        spawn 3
                in
                Expect.equal realXaxahraparak gaugeXaxahraparak
        , test "ete xaxahraparaki chaperic dus a qcum, hin vichakn a mnum" <|
            \() ->
                let
                    initialXaxahraparak =
                        [ { occupants = [], x = 0 }, { occupants = [], x = 1 } ]

                    populatedXaxahraparak =
                        populate initialXaxahraparak 3 Erexa
                in
                Expect.equal initialXaxahraparak populatedXaxahraparak
        , test "ete nes a qcum, de hajtnvum a" <|
            \() ->
                let
                    initialXaxahraparak =
                        [ { occupants = [], x = 0 }, { occupants = [], x = 1 } ]

                    populatedXaxahraparak =
                        populate initialXaxahraparak 1 Erexa

                    gaugeXaxahraparak =
                        [ { occupants = [], x = 0 }, { occupants = [ Erexa ], x = 1 } ]
                in
                Expect.equal populatedXaxahraparak gaugeXaxahraparak
        , test "ete qcac texy arden zbaxvac a, darnum en erku hogov" <|
            \() ->
                let
                    prepopulatedXaxahraparak =
                        [ { occupants = [], x = 0 }, { occupants = [ Erexa ], x = 1 } ]

                    repopulatedXaxahraparak =
                        populate prepopulatedXaxahraparak 1 Erexa

                    gaugeXaxahraparak =
                        [ { occupants = [], x = 0 }, { occupants = [ Erexa, Erexa ], x = 1 } ]
                in
                Expect.equal repopulatedXaxahraparak gaugeXaxahraparak
        ]
