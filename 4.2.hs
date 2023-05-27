import Control.Lens

{-

1.
Lens (Vorpal x) (Vorpal y) x y

-}

-- 2

data Preferences a = Preferences
  { _best :: a,
    _worst :: a
  }
  deriving (Show)

both :: Lens (Preferences a) (Preferences b) (a, a) (b, b)
both = lens get set
  where
    get p = (_best p, _worst p)
    set p (best, worst) = p {_best = best, _worst = worst}

-- 3

data Result e = Result
  { _lineNumber :: Int,
    _result :: Either e String
  }

result :: Lens (Result e) (Result f) (Either e String) (Either f String)
result = lens _result (\r result -> r {_result = result})

-- 4

data Result' e a = Error e | Success a

result' :: Lens (Result' e a) (Result' f b) (Either e a) (Either f b)
result' = lens get set
  where
    get (Error e) = Left e
    get (Success a) = Right a
    set _ (Left e) = Error e
    set _ (Right a) = Success a


-- 5

data Predicate a = Predicate (a -> Bool)

p :: Lens (Predicate a) (Predicate b) (a -> Bool) (b -> Bool)
p = lens (\(Predicate p) -> p) (\_ p -> Predicate p)
