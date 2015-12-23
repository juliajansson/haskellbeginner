import Data.Char
convert:: String->[Int]
convert xs =map digitToInt xs
{-
spec :: [Char] -> Int
spec 'c'
     | isDigit (avlista 'c') =  fromEnum (avlista 'c') - fromEnum '0'
     | (avlista 'c') >= 'a' && (avlista 'c') <= 'f' =  fromEnum (avlista 'c') - fromEnum 'a' + 10
     | (avlista 'c') >= 'A' && (avlista 'c') <= 'F' =  fromEnum (avlista 'c') - fromEnum 'A' + 10
     | otherwise            =  error "Char.digitToInt: not a digit"
-}
avlista :: [Int] -> Int
avlista [] = 0
avlista (x:[]) = x

type Tomma=Int
type Missade=Int
type Veckor=Int

missade:: [Veckor]->Missade
missade []=0
missade [_]=0
missade (x:xs)|x<(head xs)=((head xs)-x)+missade xs
              |otherwise  =missade xs

tomma:: [Veckor]->Tomma
tomma []=0
tomma [_]=0
tomma (x:xs)|x>(head xs)=(x-(head xs))+tomma xs
            |otherwise  =tomma xs
                         
solution::[Veckor]->(Tomma, Missade)
solution xs=(tomma xs, missade xs)

getList :: IO [Int]
getList = readLn


main = do
  putStr "Antal veckor ? "
  n <- readLn
  ins <- mapM (\_ -> putStr "Vecka ? " >> getLine) [1..n]
  let (t,m) = solution (convert (concat ins))
  putStrLn $ "Tomma: " ++ show t 
  putStrLn $ "Missade: " ++ show m

