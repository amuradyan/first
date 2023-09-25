module XaxahraparakSpec exposing (..)

import Expect exposing (Expectation)
import Test exposing (..)
import Xaxahraparak exposing (spawn)

suite : Test
suite =
  let
    pending: () -> Expectation
    pending = \() -> Expect.fail "pending"
  in
    describe "Xaxahraparak generation" [
      test "creating prisitne xaxahraparaks" <|
        \() ->
          let
            gaugeXaxahraparak = [{occupant = Nothing, x = 0}, {occupant = Nothing, x = 1}, {occupant = Nothing, x = 2}]
            realXaxahraparak = spawn 3
          in
            Expect.equal realXaxahraparak gaugeXaxahraparak

      , test "ete xaxahraparaki chaperic dus a qcum, hin vichakn a mnum" <| pending

      , test "ete nes a qcum, de hajtnvum a" <| pending

      , test "ete qcac texy arden zbaxvac a, darnum en erku hogov" <| pending
    ]
