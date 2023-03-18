module Items where

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
cabinet12UPrice = 532.30 :: Price
cabinet24UPrice = 799.83 :: Price
cabinet48UPrice = 2029.55 :: Price

pp48PortsPrice = 69.00 :: Price
pp24PortsPrice = 27.50 :: Price
pp12PortsPrice = 61.92 :: Price  -- 12 ports more expensive than 24?
pp12PortsFiberPrice = 259.78 :: Price

sw48PortsPrice = 661.77 :: Price
sw24PortsPrice = 314.97 :: Price
sw12PortsPrice = 254.95 :: Price
sw12PortsFiberPrice = 1_216.92 :: Price

outlet2Price = 11.30 :: Price
accessPointPrice = 80.36 :: Price

copperPrice = 0.83 :: Price
racewayPrice = 14.92 :: Price

fiber8CorePrice = undefined :: Price ---TODO
---

floor0 :: Section
floor0 = Section "Floor 0"
    [ Item "Cabinet <TODO>U"        1       undefined
    , Item "Patch Panel <?> ports"  0       undefined
    , Item "Patch Panel <!> ports"  0       undefined
    , Item "Switch <!> ports"       0       undefined
    , Item "Switch <!> ports"       0       undefined

    , Item "Double Outlet"          35      outlet2Price
    , Item "Access Point"           1       accessPointPrice

    , Item "Copper Cable"           571.95  copperPrice
    , Item "Fiber Cable"            10.52   fiber8CorePrice
    , Item "Cable Raceways"         0       racewayPrice
    ]

floor1 :: Section
floor1 = Section "Floor 0"
    [ Item "Cabinet <TODO>U"        1       undefined
    , Item "Patch Panel <?> ports"  0       undefined
    , Item "Patch Panel <!> ports"  0       undefined
    , Item "Switch <!> ports"       0       undefined
    , Item "Switch <!> ports"       0       undefined

    , Item "Double Outlet"          46      outlet2Price
    , Item "Access Point"           1       accessPointPrice

    , Item "Copper Cable"           978.43  copperPrice
    , Item "Fiber cable"            2.96    fiber8CorePrice
    , Item "Cable Raceways"         0       racewayPrice
    ]

campus :: Section
campus = Section "Campus"
    [ Item "Fiber cable"    590.46  fiber8CorePrice
    ]


main :: IO ()
main = do
    for_ (zip secs prices) $ uncurry printSection
    printf "Grand Total: %.2f€\n" $ sum prices
        where
            secs = [ floor0, floor1, campus ]
            prices = map (totalPrice . items) secs
