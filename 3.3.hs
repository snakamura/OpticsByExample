{-# LANGUAGE TemplateHaskell #-}

import Control.Lens

-- Part One
{-

1.
structure: s
focus: a

2.
getter, setter

-}

-- 3

data Ship = Ship
  { _name :: String,
    _numCrew :: Int
  }
  deriving (Show)

name :: Lens' Ship String
name = lens _name (\ship name -> ship {_name = name})

-- Part Two
{-

1.
wand :: Lens' Inventory Wand
book :: Lens' Inventory Book
potions :: Lens' Inventory [Potion]

2.
Lens' Chumble Spuzz

-}

-- 3

data Pet = Pet
  { _petName :: String,
    _petType :: String
  }

makeLenses ''Pet

getPetName :: Pet -> String
getPetName pet = view petName pet
