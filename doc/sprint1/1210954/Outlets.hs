module Main where

import Data.Foldable (traverse_)
import Data.Function (on)
import GHC.Float (roundFloat)
import Text.Printf (printf)

type Distance = Float
type Area = Float

data Room = Room { name :: String, width :: Distance, length :: Distance }
data Floor = Floor { fname :: String, rooms :: [Room] }

-- instance Show Room where
--     show (Room n w l) = printf "Room %s: %.2fx%.2f m²" n w l

--- Best practices
outletsPerMeter :: Float
outletsPerMeter = 2 / 10

toMeters :: Distance -> Distance
toMeters = (scale *)
    where scale = 5 / 258

roomArea :: Room -> Area
roomArea (Room _ w l) = on (*) toMeters w l

roomOutlets :: Room -> Int
roomOutlets = roundFloat . (outletsPerMeter *) . roomArea

showFloor :: Floor -> IO ()
showFloor (Floor fname rs) = do
    putStrLn $ fname ++ ":"
    putStrLn . unlines $ zipWith _show rs numOutlets
    printf "Total: %d outlets\n\n" $ sum numOutlets
    where
        numOutlets :: [Int]
        numOutlets = map roomOutlets rs

        _show :: Room -> Int -> String
        _show (Room n w l) = printf "Room %s (%.2fx%.2f m²) => %2d outlets" n wm lm
            where (wm, lm) = (toMeters w, toMeters l)


--- Width and length in pixels
floors :: [Floor]
floors =
    [ Floor "Floor 0"
        [ Room "A.0.1" 272 258
        , Room "A.0.2" 188 258
        , Room "A.0.3" 244 258
        , Room "A.0.4" 260 374
        , Room "A.0.5" 302 230
        , Room "A.0.6" 302 373
        ]
    , Floor "Floor 1"
        [ Room "A.1.1" 187 372
        , Room "A.1.2" 187 372
        , Room "A.1.3" 187 372
        , Room "A.1.4" 402 372
        , Room "A.1.5" 286 229
        , Room "A.1.6" 301 372
        , Room "A.1.7" 302 243
        ]
    ]


main :: IO ()
main = traverse_ showFloor floors
