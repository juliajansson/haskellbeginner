module Lists where

-- | A datatype can be _recursive_
data IntList = Empty | NonEmpty Int IntList
  deriving Show
           
test1 :: IntList
test1 = Empty

test2 :: IntList
test2 = NonEmpty 1 (NonEmpty 7 (NonEmpty 3 (NonEmpty 8 Empty)))

sumList :: IntList -> Int
sumList Empty = 0
sumList (NonEmpty first rest) = first + sumList rest

test3 :: Int
test3 = sumList test2

countDown :: Int -> IntList
countDown n | n < 0 = error "Cannot count down from a negative number"
countDown 0 = Empty
countDown n = NonEmpty n (countDown (n-1))

test4 :: IntList
test4 = countDown 10

showIntList :: IntList -> String
showIntList Empty = ""
showIntList (NonEmpty first rest) = show first ++ "," ++ showIntList rest

test5 :: String
test5 = showIntList test4
