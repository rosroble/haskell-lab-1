{-# OPTIONS_GHC -Wno-name-shadowing #-}
-- Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.
-- Since 6*9^5 = 354929 < 999999 - maximum 6-digit number, there is no point in searching above this limit
module Euler30
    (solveRec,
     solveRecTail,
     solveMap,
     solveInfList,
     solveListGen) where

powInt :: Int -> Int -> Int

powInt a n
    | n == 0 = 1
    | otherwise = a * powInt a (n - 1)

toDigits :: Int -> [Int]

toDigits x
    | x == 0 = []
    | otherwise = toDigits (div x 10) ++ [mod x 10]

sumPower :: Int -> [Int] -> Int

sumPower p arr
    | null arr = 0
    | otherwise = powInt (last arr) p + sumPower p (init arr)

solveRec :: Int -> Int -> Int

solveRec p n
        | n == 10 = 0
        | otherwise = solveRec p (n - 1) + if sumPower p (toDigits n) == n then n else 0

solveRecTail :: Int -> Int -> Int

solveRecTail p n = helper p n 0
    where
        helper _ 10 s = s
        helper p n s = helper p (n - 1) (s + if n == sumPower p (toDigits n) then n else 0)

solveMap :: Int -> Int -> Int

solveMap p n = sum $ map snd (filter (uncurry (==)) (map (\x -> (x, sumPower p (toDigits x))) [10..n]))

solveListGen :: Int -> Int -> Int

solveListGen p n = sum [x | x <- [10..n-1], sumPower p (toDigits x) == x]

solveInfList :: Int -> Int -> Int

solveInfList p n = sum $ map snd $ filter (uncurry (==)) $ take n $ map (\x -> (x, sumPower p (toDigits x))) [10..]



