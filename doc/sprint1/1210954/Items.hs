module Main where

import Control.Monad (liftM2)
import Data.Foldable (for_)
import GHC.Float (int2Float)
import Text.Printf (printf)

type Price = Float

data Item = Item { iname :: String, amt :: Float, price :: Price }
data Section = Section { sname :: String, items :: [Item] }

instance Show Item where
    show (Item n a p) = printf "%s: %d x %.2f€" n a p


itemPrice :: Item -> Price
itemPrice = liftM2 (*) amt price

totalPrice :: [Item] -> Price
totalPrice = foldl addPrice 0.0
    where addPrice b = (b+) . itemPrice

printSection :: Section -> Price -> IO ()
printSection (Section _ []) _ = putStrLn "Empty Section!"
printSection (Section name its) p = do
    putStrLn (name ++ ":")
    for_ its print
    printf "Total price: %.2f€\n\n" p


--- Prices
outlet2Price = 11.30 :: Price
copperPrice = 0.83 :: Price
fiberPrice = undefined :: Price
---

floor0 :: Section
floor0 = Section "Floor 0"
    [ Item "Double Outlet"      35      outlet2Price
    , Item "Copper cable"       571.95  copperPrice
    , Item "Fiber cable"        15.92   fiberPrice
    ]

floor1 :: Section
floor1 = Section "Floor 0"
    [ Item "Double Outlet"      46      outlet2Price
    , Item "Fiber cable"        4.44    fiberPrice
    ]

campus :: Section
campus = Section "Campus"
    [ Item "Fiber cable"        758.05  fiberPrice
    ]


main :: IO ()
main = do
    for_ (zip secs prices) $ uncurry printSection
    printf "Grand Total: %.2f€\n" $ sum prices
        where
            secs = [ floor0, floor1, campus ]
            prices = map (totalPrice . items) secs
