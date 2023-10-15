module Euler1
  ( findSumMultiplies3or5below_rec,
    findSumMultiplies3or5below_tail,
    findSumMultiplies3or5below_map,
    findSumMultiplies3or5below_listgen,
    findSumMultiplies3or5below_inflist,
  )
where

findSumMultiplies3or5below_rec :: Int -> Int
findSumMultiplies3or5below_rec n = findSumMultiplies3or5 (n - 1)
  where
    findSumMultiplies3or5 0 = 0
    findSumMultiplies3or5 n0 = findSumMultiplies3or5 (n0 - 1) + if mod n0 3 == 0 || mod n0 5 == 0 then n0 else 0

findSumMultiplies3or5below_tail :: Int -> Int
findSumMultiplies3or5below_tail n = if n >= 3 then helper n 0 3 else undefined
  where
    helper n0 s k = if k == n0 then s else helper n0 (s + if mod k 3 == 0 || mod k 5 == 0 then k else 0) (k + 1)

findSumMultiplies3or5below_map :: Int -> Int
findSumMultiplies3or5below_map n = sum $ map (\x -> if mod x 5 == 0 || mod x 3 == 0 then x else 0) [1 .. n - 1]

findSumMultiplies3or5below_listgen :: Int -> Int
findSumMultiplies3or5below_listgen n = sum [x | x <- [1 .. n - 1], mod x 3 == 0 || mod x 5 == 0]

findSumMultiplies3or5below_inflist :: Int -> Int
findSumMultiplies3or5below_inflist n = sum $ take (n - 1) $ map (\x -> if mod x 5 == 0 || mod x 3 == 0 then x else 0) [1 ..]
