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
g1 = Single Monday Wednesday "Snape"
g2 :: Guest
g2 = Couple Tuesday Friday "Hermione" "Ron"

checkIn  :: Guest -> Weekday
checkIn  (Single i _o _n)       = i
checkIn  (Couple i _o _n1 _n2)  = i

checkOut :: Guest -> Weekday
checkOut (Single _i o _n)       = o
checkOut (Couple _i o _n1 _n2)  = o

test :: (Guest, Guest)
test = (g1, g2)
