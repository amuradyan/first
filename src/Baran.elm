module Baran exposing (..)

type Guyn = Red | Blue | Green

type alias Baran =
    {
        guyn: Guyn
    -- ,   yaTvoy: Kto
    }

baran: Baran
baran = { guyn = Red }



type Dzi = Nupagadzi | Getadzi

dzi: Baran -> Dzi
dzi { guyn } =
    case guyn of
        Red -> Nupagadzi
        _ -> Getadzi


-- -- Зайка моя! Я твой зайчик
-- -- Ручка моя! Я твой пальчик
-- -- Рыбка моя! Я твой глазик
-- -- Банька моя! Я твой тазик
-- -- Солнце мое! Я твой лучик
-- -- Дверца моя! Я твой ключик
-- -- Ты стебелек - Я твой пестик
-- -- Мы навсегда с тобой вместе
-- -- Зайка моя!

-- type YaTvoy = Zaychik | Palchik | Glazik | Tazik | Luchik | Kluchik | Pestik
-- type Moya = Zayka | Ruchka | Ripka | Banyka | Solnce | Dverca | Stebelyok

-- moya: Moya -> Moya
-- moya kto = kto

-- yaTvoy: Moya -> YaTvoy
-- ktoYa kto =
--     case kto of
--         Zayka |> moya -> yaTvoy Zaychik
--         Ruchka -> Palchik
