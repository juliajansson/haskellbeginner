module Datatypes where

data Size = Small | Medium | Large
  deriving Show

-- | Compute the volume in litres for a soda-machine
drinkVolume :: Size -> Double
drinkVolume Small   = 0.2
drinkVolume Medium  = 0.4
drinkVolume Large   = 0.6

data Weekday = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday
  deriving Show

weekEnd :: Weekday -> Bool
weekEnd Saturday = True
weekEnd Sunday   = True
weekEnd _        = False

type Name = String

-- | Hog's Head Inn guest datatype
data Guest = Single Weekday Weekday Name 
           | Couple Weekday Weekday Name Name
  deriving Show

g1 :: Guest
g1 = Single Monday Wednesday "Luna"
g2 :: Guest
g2 = Couple Tuesday Friday "Hermione" "Ron"
--Oh my god Romione!!!/Julia
g3 :: Guest
g3 = Single Saturday Sunday "Snuffles"
--;))/Julia
g4 :: Guest
g4 = Single Monday Tuesday "Snape"

checkIn  :: Guest -> Weekday
checkIn  (Single i _o _n)       = i
checkIn  (Couple i _o _n1 _n2)  = i

checkOut :: Guest -> Extend Weekday
checkOut (Single _i _o "Snape") = Never
checkOut (Single _i o _n)       = Normal o
checkOut (Couple _i o _n1 _n2)  = Normal o

data Extend d = Normal d | Never

showExtend :: Show d => Extend d -> String
showExtend Never = "Snape is ALWAYS going to stay there."
showExtend (Normal d) = show d

instance Show d => Show (Extend d) where
  show = showExtend

test0 :: String
test0 = showExtend (checkOut g4)

test1 :: Weekday
test1 =  checkIn g1

test2 :: Weekday
test2 = checkIn g2

list1 :: [Guest]
list1 = [g1,g2,g3,g4]

list2 :: [Guest]
list2 = [g1,g2,g3]

test3 :: [Weekday]
test3 = map checkIn list1

test4 :: [Extend Weekday]
test4 = map checkOut list2

{-Why doesn't this work?
test5 :: [Extend Weekday]
test5 = checkOut g4

list3 :: [Extend Weekday]
list3 = [test1, test5]
-}
