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
population (n:k:_)  = n : iterate (\xi -> k * xi * (1000 - xi) / 1000) n
population _        = error "Given arguments can not provide population."

-- Takes list of values and put them into a formatted string.
displayPop :: Int -> [Double] -> String
displayPop i t
        | i > 0 = displayPop (i - 1) t ++ (show i) ++ " " ++ (show $ t !! i) ++ "\n"
        | otherwise = ""

-- Do something different based on whether ac == 2 or 3.
actlen :: [Double] -> String
actlen t
    | l == 2 = init . (displayPop 100) $ population t
    | l == 3 = undefined
    | otherwise = error "Incorrect number of arguments."
    where l = length t;

main :: IO()
main = do
    a <- getArgs
    putStrLn $ actlen $ map read a
