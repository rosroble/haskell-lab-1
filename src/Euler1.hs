module Euler1
  ( findSumMultiplies3or5below_rec,
    findSumMultiplies3or5below_tail,
    findSumMultiplies3or5below_map,
    findSumMultiplies3or5below_listgen,
    findSumMultiplies3or5below_inflist,
  )
where

findSumMultiplies3or5below_rec :: [Int] -> Int -> Int
findSumMultiplies3or5below_rec divs n = findSumMultiplies3or5 (n - 1)
  where
    findSumMultiplies3or5 0 = 0
    findSumMultiplies3or5 n0
      | any (\d -> mod n0 d == 0) divs = findSumMultiplies3or5 (n0 - 1) + n0
      | otherwise = findSumMultiplies3or5 (n0 - 1)

findSumMultiplies3or5below_tail :: [Int] -> Int -> Int
findSumMultiplies3or5below_tail divs n
  | n >= 3 = helper 0 (minimum divs)
  | otherwise = 0
  where
    helper s k
      | k == n = s
      | any (\d -> mod k d == 0) divs = helper (s + k) (k + 1)
      | otherwise = helper s (k + 1)

findSumMultiplies3or5below_map :: [Int] -> Int -> Int
findSumMultiplies3or5below_map divs n = sum $ map (\x -> if any (\d -> mod x d == 0) divs then x else 0) [1 .. n - 1]

findSumMultiplies3or5below_listgen :: [Int] -> Int -> Int
findSumMultiplies3or5below_listgen divs n = sum [x | x <- [1 .. n - 1], any (\d -> mod x d == 0) divs]

findSumMultiplies3or5below_inflist :: [Int] -> Int -> Int
findSumMultiplies3or5below_inflist divs n = sum $ take (n - 1) $ map (\x -> if any (\d -> mod x d == 0) divs then x else 0) [1 ..]
