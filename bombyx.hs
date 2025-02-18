{-
-- EPITECH PROJECT, 2025
-- 106bombyx
-- File description:
-- Calculons les papillons !
-}

module Main where

import System.Exit
import System.Environment

-- Takes argv as doubles and returns list of values. Could be a comprehension list.
population :: [Double] -> [Double]
population (n:k:_) = undefined
population _ = error "Given arguments can not provide population."

-- Takes list of values and put them into a formatted string.
displayPop :: Int -> [Double] -> String
displayPop i t 
        | i > 0   = undefined ++ displayPop (i - 1) t
        | otherwise = ""

main :: IO()
main = do
    a <- getArgs
    putStrLn $ (displayPop 100) $ population $ map read a
