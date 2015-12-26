import Data.Char
convert :: String->[Int]
convert = map digitToInt


{-
main = do
  putStr "Antal dagar ? "
  n <- readLn
  ins <- mapM (\_ -> putStr "Mognar dag ? " >> getLine) [1..n]
  svar (solution (convert (concat ins)))
-}
