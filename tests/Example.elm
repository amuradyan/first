module Example exposing (..)

import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import Test exposing (..)


suite : Test
suite =
    describe "mekin gumarac mek" [
        test "take mekin and gumarac mek" <|
            \() ->
                let
                  x = 2
                  c = 6
                in
                  Expect.equal (x + c) (2 + 6)

    ,  test "alo alo" <|
          \_ ->
            Expect.equal {g = 1, h = 1} {g = 1, h = 1}
    ]
