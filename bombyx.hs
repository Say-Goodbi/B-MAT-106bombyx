{-
-- EPITECH PROJECT, 2025
-- 106bombyx
-- File description:
-- Calculons les papillons !
-}

module Main where

import System.Exit
import System.Environment
import Control.Monad
import Data.Maybe
import Text.Read (readMaybe)
import Numeric

showDouble :: Double -> String
showDouble x = showFFloat (Just 2) x ""
-- Takes argv as doubles and returns list of values. Could be a comprehension list.
pop :: [Double] -> [Double]
pop (n:k:_)  = n : iterate (\xi -> k * xi * (1000 - xi) / 1000) n
pop _        = error "Given arguments can not provide population."

-- Takes list of values and put them into a formatted string.
displayPop :: Int -> [Double] -> [String]
displayPop i t
    | i > 0 = displayPop (i - 1) t ++ [unwords [show i, (showDouble (t !! i))]]
    | otherwise = []
{-
printH :: [Double] -> Maybe String
printH _ = Just $ readFile "help.txt"
-}

synthScheme :: Double -> [Double] -> [(Double, Double)]
synthScheme k t
    | k >= 4 = []
    | otherwise = zip (replicate 11 k) (drop i0 $ (\x -> take tot x) $
        pop [n, k]) ++ synthScheme (k + 0.01) t
    where n = t !! 0;
          i0 = round (t !! 1);
          i1 = round (t !! 2);
          tot = i0 + i1;

displayZip :: [(Double, Double)] -> [String]
displayZip [] = []
displayZip ((a, b):s) = [unwords $ map showDouble [a, b]] ++ displayZip s

-- Do something different based on whether ac == 2 or 3.
actlen :: [Double] -> Maybe String
actlen t
    | l == 2 && pos && k = Just $ init . unlines . (displayPop 100) $ pop t
    | l == 3 && pos = Just $ init . unlines . displayZip $ synthScheme 1 t
    | otherwise = Nothing
    where l = length t;
          n = t !! 0;
          pos = all (> 0) t;
          k = (\x -> (x >= 1) && (x <= 4)) $ t !! 1 ;

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
