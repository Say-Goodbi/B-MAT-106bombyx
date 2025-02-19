{-
-- EPITECH PROJECT, 2025
-- 106bombyx
-- File description:
-- Calculons les papillons !
-}

module Main where

import System.Exit
import System.Environment
import Data.Maybe
import Text.Read (readMaybe)

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
actlen :: [Double] -> Maybe String
actlen t
    | l == 2 = Just $ init . (displayPop 100) $ population t
    | l == 3 = Just $ undefined
    | otherwise = Nothing
    where l = length t;

-- If there's a list in a Just, returns that list. Else, returns an empty list. 
verifyMaybe :: Eq a => Maybe [a] -> [a]
verifyMaybe Nothing = []
verifyMaybe x = fromJust x

main :: IO()
main = do
    a <- getArgs
    case actlen . verifyMaybe . sequenceA $ map readMaybe a of
        Nothing -> exitWith (ExitFailure 84)
        a -> putStrLn $ fromJust a
