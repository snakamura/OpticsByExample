{-# LANGUAGE TemplateHaskell #-}

import Control.Lens

-- 1

data Gate = Gate
  { _open :: Bool,
    _oilTemp :: Float
  }
  deriving (Show)

makeLenses ''Gate

data Army = Army
  { _archers :: Int,
    _knights :: Int
  }
  deriving (Show)

makeLenses ''Army

data Kingdom = Kingdom
  { _name :: String,
    _army :: Army,
    _gate :: Gate
  }
  deriving (Show)

makeLenses ''Kingdom

duloc :: Kingdom
duloc =
  Kingdom
    { _name = "Duloc",
      _army =
        Army
          { _archers = 22,
            _knights = 14
          },
      _gate =
        Gate
          { _open = True,
            _oilTemp = 10.0
          }
    }

goalA = duloc & name <>~ ": a perfect place"
              & army . knights +~ 28
              & gate . open .~ False

goalB = duloc & name <>~ "instein"
              & army . archers -~ 5
              & army . knights +~ 12
              & gate . oilTemp *~ 10

goalC = duloc & name <>~ ": Home"
              & gate . oilTemp //~ 2
              & name <<<>~ " of the talking Donkeys"

-- 2

a1 = (False, "opossums") & _1 ||~ True

a2 = 2 & id *~ 3

{-

3.
^.

4.
(%~) :: Lens s t a b -> (a -> b) -> s -> t

-}