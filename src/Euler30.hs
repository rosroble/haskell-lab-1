-- Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.
-- Since 6*9^5 = 354929 < 999999 - maximum 6-digit number, there is no point in searching above this limit
module Euler30
  ( solveRec,
    solveRecTail,
    solveMap,
    solveInfList,
    solveListGen,
  )
where

powInt :: Int -> Int -> Int
powInt _ 0 = 1
powInt a n = a * powInt a (n - 1)

toDigits :: Int -> [Int]
toDigits 0 = []
toDigits x = toDigits (div x 10) ++ [mod x 10]

sumPower :: Int -> [Int] -> Int
sumPower _ [] = 0
sumPower p arr = powInt (last arr) p + sumPower p (init arr)

solveRec :: Int -> Int -> Int
solveRec _ 10 = 0
solveRec p n
  | sumPower p (toDigits n) == n = solveRec p (n - 1) + n
  | otherwise = solveRec p (n - 1)

solveRecTail :: Int -> Int -> Int
solveRecTail p n = helper p n 0
  where
    helper _ 10 s = s
    helper p0 n0 s
      | n0 == sumPower p0 (toDigits n0) = helper p0 (n0 - 1) (s + n0)
      | otherwise = helper p0 (n0 - 1) s

solveMap :: Int -> Int -> Int
solveMap p n = sum $ map snd (filter (uncurry (==)) (map (\x -> (x, sumPower p (toDigits x))) [10 .. n]))

solveListGen :: Int -> Int -> Int
solveListGen p n = sum [x | x <- [10 .. n - 1], sumPower p (toDigits x) == x]

solveInfList :: Int -> Int -> Int
solveInfList p n = sum $ map snd $ filter (uncurry (==)) $ take n $ map (\x -> (x, sumPower p (toDigits x))) [10 ..]
