import Data.Char
kanbyta :: String->String->Bool
kanbyta []  []  = True
kanbyta []  _   = False
kanbyta _   []  = False
kanbyta [a] [b] = True
kanbyta (a:as) (b:bs) | a==b      = kanbyta as bs
                      | as==bs    = True
                      | otherwise = False

nästanamnsdag :: String->Int->[String]->Int
nästanamnsdag as k bss | isTrue ts = nummer True ts
                       | otherwise = k
    where ts = map (kanbyta as) bss

nummer :: Eq a=> a->[a]->Int
nummer a [x]    | a==x      = 1
nummer a (x:xs) | a==x      = 1
                | otherwise = 1+ nummer a xs

isTrue :: [Bool]->Bool
isTrue []     = False
isTrue (x:xs) = x || isTrue xs

main = do
  as  <- getLine
  k   <- readLn
  bss <- mapM (\_ -> getLine) [1..k]
  print (nästanamnsdag as k bss)
