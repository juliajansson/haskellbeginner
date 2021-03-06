import Data.Char

siffersumma:: Integer->Integer
siffersumma a= sum (map special (show a))

special :: Char -> Integer
special c
  | isDigit c            =  toInteger (fromEnum c - fromEnum '0')
  | c >= 'a' && c <= 'f' =  toInteger (fromEnum c - fromEnum 'a' + 10)
  | c >= 'A' && c <= 'F' =  toInteger (fromEnum c - fromEnum 'A' + 10)
  | otherwise            =  error "Char.digitToInt: not a digit"

-- TODO: förenkla mönster med exempelvis denna hjälpfunktion
divpow x n = div x (10^n)

väljtal :: Integer->Integer
väljtal x|0 < div x 100000 && div x 100000 < 10 = 1000000+(div x 100000 -1)
         |0 < div x 1000000 && div x 1000000 < 10 = 10000000+(div x 1000000 -1)
         |0 < div x 10000000 && div x 10000000 < 10 = 100000000+(div x 10000000 -1)
         |0 < div x 100000000 && div x 100000000 < 10 = 1000000000+(div x 100000000 -1)
         |0 < div x 1000000000 && div x 1000000000 < 10 = 10000000000+(div x 1000000000 -1)
         |0 < div x 10000000000 && div x 10000000000 < 10 = 100000000000+(div x 10000000000 -1)
         |0 < div x 100000000000 && div x 100000000000 < 10 = 1000000000000+(div x 100000000000 -1)
         |0 < div x 1000000000000 && div x 1000000000000 < 10 = 10000000000000+(div x 1000000000000 -1)
         |0 < div x 10000000000000 && div x 10000000000000 < 10 = 100000000000000+(div x 10000000000000 -1)
         |0 < div x 100000000000000 && div x 100000000000000 < 10 = 1000000000000000+(div x 100000000000000 -1)
         |0 < div x 1000000000000000 && div x 1000000000000000 < 10 = 10000000000000000+(div x 1000000000000000 -1)
         |0 < div x 10000000000000000 && div x 10000000000000000 < 10 = 100000000000000000+(div x 10000000000000000 -1)
         |0 < div x 100000000000000000 && div x 100000000000000000 < 10 = 1000000000000000000+(div x 100000000000000000 -1)
         |0 < div x 1000000000000000000 && div x 1000000000000000000 < 10 = 10000000000000000000+(div x 1000000000000000000 -1)
         |0 < div x 10000000000000000000 && div x 10000000000000000000 < 10 = 100000000000000000000+(div x 10000000000000000000 -1)
         |0 < div x 100000000000000000000 && div x 100000000000000000000 < 10 = 1000000000000000000000+(div x 100000000000000000000 -1)
         |otherwise = [b | b<-[x..], siffersumma b == siffersumma x] !! 1

main = do
  n<-readLn
  print (väljtal n)
