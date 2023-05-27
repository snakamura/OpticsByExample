{-# LANGUAGE TemplateHaskell #-}

import Control.Lens

data User = User
  { _firstName :: String,
    _lastName :: String,
    _email :: String
  }
  deriving (Show)

makeLenses ''User

-- 1
username :: Lens' User String
username = email

-- 2
fullName :: Lens' User String
fullName = lens get set
  where
    get User {_firstName, _lastName} = _firstName <> " " <> _lastName
    set user fullName =
      case break (== ' ') fullName of
        (firstName, "") -> user {_firstName = firstName, _lastName = ""}
        (firstName, lastName) -> user {_firstName = firstName, _lastName = tail lastName}
