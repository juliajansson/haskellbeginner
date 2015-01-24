--How do you write the types? :F
--1.1
doubleMe:: Int -> Int
doubleMe x = x + x

--1.2
doubleUs:: Int -> Int -> (Int, Int)
doubleUs x y = (doubleMe x, doubleMe y)

--1.3
doubleSmallNumber x = if x>100
                      then x
                      else x*2

--1.4 
createOddNumber x = (doubleMe x) + 1

--2.1
factorial 0 = 1
factorial n =
  if n>0 
  then n * factorial (n - 1)
  else error "Oh noes :'("

main = print (factorial (-19))
