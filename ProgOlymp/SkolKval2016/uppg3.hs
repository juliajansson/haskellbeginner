import Data.Map
data Pos = Vänster | Höger | Båda
  deriving Show
type Kulram = Map Pos Int
type Tvåkulram = [Pos]
type N = Int
type R = Int
type Rv=[Int]
type Rh=[Int]

plustvå :: Int->Pos->Pos
plustvå 0 p       = p
plustvå 1 Vänster = Höger
plustvå 1 Höger   = Vänster
plustvå n p       = plustvå (mod n 2) p

-- TODO: denna definition är rekursiv men saknar basfall
plusfyra n p = plusfyra (mod n 4) p

plus::Int->(Int,Int)->(Int,Int)
plus 0 p      = p
plus 1 (0, x) = (1, x-1)
plus 1 (x, 0) = (0, x)

unfold p h t x|p x      =[]
              |otherwise=h x:unfold p h t (t x)

bin2int :: [Int] -> Int
bin2int = Prelude.foldr (\x y->x+2*y) 0
int2bin :: Int -> [Int]
int2bin = unfold (==0) (`mod` 2) (`div` 2)

position::(Int,Int)->Pos
position (0, _) = Höger
position (_, 0) = Vänster
position (x, y) = Båda

fråga :: Read a => String -> IO a
fråga text = do
  putStr text
  readLn

frågor :: Read a => Int -> String -> IO [a]
frågor n text = mapM (\i -> fråga (text ++ show i ++ " ? ")) [1..n]

svar :: Show a => a -> IO ()
svar x = putStrLn ("Svar: " ++ show x)

main = do
  r  <- fråga "Antal rader ? "
  rv <- frågor r "Rad, vänster "
  rh <- frågor r "Rad, höger "
  n  <- fråga "Talet N ? "
  svar (solution r rv rh n)
{-
va::Int->Tvåkulram->Tvåkulram
va 0 xs=xs
va 1 xs++[Höger]=xs++[Vänster]
va 1 (xs++[x,Vänster])=(xs++[(plustvå 1 p), Höger])
va n [a,b,c,d]=[a,b,c, plustvå n d]
-}

solution :: Int->[Int]->[Int]->Int->[(Int,Int)]
solution r xs ys n = addera n (zip xs ys)

addera :: Int->[(Int,Int)]->[(Int, Int)]
addera 0 xs = xs
addera 1 [(0,1),(0,1),(0,1),(0,1)] = [(1,0),(1,0),(1,0),(1,0)]
addera 1 [(1,0),(1,0),(1,0),(1,0)] = [(0,1),(0,1),(0,1),(0,1)]
addera n xs = addera (mod n 2) xs
