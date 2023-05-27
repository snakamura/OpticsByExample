import Control.Lens

data ProducePrices = ProducePrices
  { _limePrice :: Float,
    _lemonPrice :: Float
  }
  deriving (Show)

-- 1

limePrice1 :: Lens' ProducePrices Float
limePrice1 = lens get set
  where
    get = _limePrice
    set producePrices price =
      producePrices
        { _limePrice = max 0 price
        }

lemonPrice1 :: Lens' ProducePrices Float
lemonPrice1 = lens get set
  where
    get = _lemonPrice
    set producePrices price =
      producePrices
        { _lemonPrice = max 0 price
        }

-- 2

limePrice2 :: Lens' ProducePrices Float
limePrice2 = lens get set
  where
    get = _limePrice
    set producePrices price =
      let limePrice = max 0 price
       in producePrices
            { _limePrice = limePrice,
              _lemonPrice = trim (_lemonPrice producePrices) (limePrice - 0.5) (limePrice + 0.5)
            }

lemonPrice2 :: Lens' ProducePrices Float
lemonPrice2 = lens get set
  where
    get = _lemonPrice
    set producePrices price =
      let lemonPrice = max 0 price
       in producePrices
            { _lemonPrice = lemonPrice,
              _limePrice = trim (_limePrice producePrices) (lemonPrice - 0.5) (lemonPrice + 0.5)
            }

trim :: Float -> Float -> Float -> Float
trim n = min . max n
