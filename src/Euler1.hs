module Euler1
  ( findSumMultiplies3or5below_rec,
    findSumMultiplies3or5below_tail,
    findSumMultiplies3or5below_map,
    findSumMultiplies3or5below_listgen,
    findSumMultiplies3or5below_inflist,
  )
where

findSumMultiplies3or5below_rec :: Int -> Int -> Int -> Int
findSumMultiplies3or5below_rec d1 d2 n = findSumMultiplies3or5 (n - 1)
  where
    findSumMultiplies3or5 0 = 0
    findSumMultiplies3or5 n0
      | mod n0 d1 == 0 || mod n0 d2 == 0 = findSumMultiplies3or5 (n0 - 1) + n0
      | otherwise = findSumMultiplies3or5 (n0 - 1)

findSumMultiplies3or5below_tail :: Int -> Int -> Int -> Int
findSumMultiplies3or5below_tail d1 d2 n
  | n >= 3 = helper 0 (min d1 d2)
  | otherwise = 0
  where
    helper s k
      | k == n = s
      | mod k d1 == 0 || mod k d2 == 0 = helper (s + k) (k + 1)
      | otherwise = helper s (k + 1)

findSumMultiplies3or5below_map :: Int -> Int -> Int -> Int
findSumMultiplies3or5below_map d1 d2 n = sum $ map (\x -> if mod x d1 == 0 || mod x d2 == 0 then x else 0) [1 .. n - 1]

findSumMultiplies3or5below_listgen :: Int -> Int -> Int -> Int
findSumMultiplies3or5below_listgen d1 d2 n = sum [x | x <- [1 .. n - 1], mod x d1 == 0 || mod x d2 == 0]

findSumMultiplies3or5below_inflist :: Int -> Int -> Int -> Int
findSumMultiplies3or5below_inflist d1 d2 n = sum $ take (n - 1) $ map (\x -> if mod x d1 == 0 || mod x d2 == 0 then x else 0) [1 ..]
