module XaxahraparakSpec exposing (..)

import Expect exposing (Expectation)
import Test exposing (..)
import Xaxahraparak exposing (Occupant(..), clear, move, occupantsOf, populate, spawn)


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
        , test "եթե խաղահրապարակի չափերից դուս ա քցում, հին վիճակնա նմում" <|
            \() ->
                let
                    initialXaxahraparak =
                        [ { occupants = [], x = 0 }, { occupants = [], x = 1 } ]

                    populatedXaxahraparak =
                        populate 3 Erexa initialXaxahraparak
                in
                Expect.equal initialXaxahraparak populatedXaxahraparak
        , test "եթե նես ա քցում, դե հայտնվում ա" <|
            \() ->
                let
                    initialXaxahraparak =
                        [ { occupants = [], x = 0 }, { occupants = [], x = 1 } ]

                    populatedXaxahraparak =
                        populate 1 Erexa initialXaxahraparak

                    gaugeXaxahraparak =
                        [ { occupants = [], x = 0 }, { occupants = [ Erexa ], x = 1 } ]
                in
                Expect.equal populatedXaxahraparak gaugeXaxahraparak
        , test "եթե քցած տեղը զբաղված ա, դառնում են երկու հոգով" <|
            \() ->
                let
                    prepopulatedXaxahraparak =
                        [ { occupants = [], x = 0 }, { occupants = [ Erexa ], x = 1 } ]

                    repopulatedXaxahraparak =
                        populate 1 Erexa prepopulatedXaxahraparak

                    gaugeXaxahraparak =
                        [ { occupants = [], x = 0 }, { occupants = [ Erexa, Erexa ], x = 1 } ]
                in
                Expect.equal repopulatedXaxahraparak gaugeXaxahraparak

        -- , test "Աշխարհից դուս գալուց գալի հագնում ա պատին ու լռվում ա" <|
        --     \() ->
        --         let
        --             prepopulatedXaxahraparak =
        --                 [ { occupants = [ Erexa ], x = 0 }, { occupants = [], x = 1 } ]
        --             updatedXaxahraparak =
        --                 move 3 0 prepopulatedXaxahraparak
        --             gaugeXaxahraparak =
        --                 [ { occupants = [], x = 0 }, { occupants = [ Erexa ], x = 1 } ]
        --         in
        --         Expect.equal updatedXaxahraparak gaugeXaxahraparak
        , test "Թե պետք ա կարում ա, շարժվում ա" <|
            \() ->
                let
                    prepopulatedXaxahraparak =
                        [ { occupants = [ Erexa ], x = 0 }, { occupants = [], x = 1 }, { occupants = [], x = 2 } ]

                    updatedXaxahraparak =
                        move 2 0 prepopulatedXaxahraparak

                    gaugeXaxahraparak =
                        [ { occupants = [], x = 0 }, { occupants = [], x = 1 }, { occupants = [ Erexa ], x = 2 } ]
                in
                Expect.equal updatedXaxahraparak gaugeXaxahraparak

        , test "Դատարկ տեղը չես մաքրի" <|
            \() ->
                let
                    prepopulatedXaxahraparak =
                        [ { occupants = [], x = 0 } ]
                    updatedXaxahraparak =
                        clear 0 prepopulatedXaxahraparak
                    gaugeXaxahraparak =
                        [ { occupants = [], x = 0 } ]
                in
                Expect.equal updatedXaxahraparak gaugeXaxahraparak
        , test "Մաքրելուց սաղ պտի մաքրես" <|
            \() ->
                let
                    prepopulatedXaxahraparak =
                        [ { occupants = [ Erexa, Erexa ], x = 0 } ]
                    updatedXaxahraparak =
                        clear 0 prepopulatedXaxahraparak
                    gaugeXaxahraparak =
                        [ { occupants = [], x = 0 } ]
                in
                Expect.equal updatedXaxahraparak gaugeXaxahraparak
        , test "Դատարկ տեղից բան չես վեկալի" <|
            \() ->
                let
                    occupantsOfAnEmptyCell =
                        occupantsOf 0 [ { occupants = [], x = 0 } ]
                in
                Expect.equal occupantsOfAnEmptyCell []
        , test "Չէլած տեղից բան չես վեկալի տակավին" <|
            \() ->
                let
                    occupantsOfAnEmptyCell =
                        occupantsOf 0 [ { occupants = [], x = 0 } ]
                in
                Expect.equal occupantsOfAnEmptyCell []
        , test "Լիքը տեղից կվեկալես" <|
            \() ->
                let
                    occupantsOfAnEmptyCell =
                        occupantsOf 0 [ { occupants = [ Erexa, Erexa, Garaj ], x = 0 } ]
                in
                Expect.equal occupantsOfAnEmptyCell [ Erexa, Erexa, Garaj ]
        ]
