import Control.Lens

-- 1

lens1 :: Lens' (Int, Int) Int
lens1 = lens get set
  where
    get = fst
    set (n, m) v = (n, m + v)

{-

2.
get-set: Yes
set-set: Yes

-}

-- 3

data Err
  = ReallyBadError {_msg :: String}
  | ExitCode {_code :: Int}

msg :: Lens' Err String
msg = lens get set
  where
    get (ReallyBadError msg) = msg
    get (ExitCode code) = ""
    set _ msg = ReallyBadError msg

-- 6

data Builder = Builder
  { _context :: [String],
    _build :: [String] -> String
  }

lens6 :: Lens' Builder String
lens6 = lens get set
  where
    get (Builder context build) = build context
    set (Builder context build) s = Builder context $ \context' ->
      if context == context'
        then s
        else build context
