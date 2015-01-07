import System.Random
--How do you write the types? :F
doubleMe:: Int -> Int
doubleMe x = x + x

doubleUs:: Int -> Int -> (Int, Int)
doubleUs x y = (doubleMe x, doubleMe y)

doubleSmallNumber x = if x>100
then x
else x*2
 
createOddNumber x = (doubleMe x) + 1

