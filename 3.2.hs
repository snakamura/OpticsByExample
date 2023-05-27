{-

1.
structure: (Bool, (Int, String))
focus: Int

2.
Lens' (Char, Int), Char

3.
view, over, set

4.
_3

5.
over :: Lens' (Bool, Int) Int -> (Int -> Int) -> (Bool, Int) -> (Bool, Int)
_2 :: Lens' (Bool, Int) Int
(*10) :: Int -> Int
(False, 2) :: (Bool, Int)

result: (False, 20)

-}
