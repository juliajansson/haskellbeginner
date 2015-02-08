module Functions where

squareArea :: Double -> Double
squareArea side = side*side

test1 :: Double
test1 = squareArea 5
  
circleArea :: Double -> Double
circleArea radius = pi * radius * radius

test2 :: Double
test2 = circleArea 1
  
ageSum :: Int -> Int -> Int
ageSum x y = x + y

pAge :: Int
pAge = 42

jAge :: Int
jAge = 15
  
test3 :: Int
test3 = ageSum pAge jAge

isAdult :: Int -> Bool
isAdult x = x >= 18

test4 :: Bool
test4 = isAdult pAge

compareAge :: Int -> Int -> String
compareAge x y | x < y      = "The first is "++ show (y-x) ++ " years younger"
               | x > y      = "The first is "++ show (x-y) ++ " years older"
               | otherwise  = "Both are of the same age: " ++ show x

test5 :: String
test5 = compareAge pAge jAge

yearOrYears :: Int -> String
yearOrYears x = if x == 1  then  "1 year"
                           else  show x ++ " years"

test6 :: String
test6 = yearOrYears 1 ++ ", " ++ yearOrYears 2

compareAge2 :: Int -> Int -> String
compareAge2 x y | x < y      = "The first is "++ yearOrYears (y-x) ++ " younger"
                | x > y      = "The first is "++ yearOrYears (x-y) ++ " older"
                | otherwise  = "Both are of the same age: " ++ show x

test7 :: String
test7 = compareAge2 16 17


test :: (Double, Double, Int, Bool, String, String, String)
test = (test1, test2, test3, test4, test5, test6, test7)
