import Data.List
--Uppgift 1, lagomvinkliga trianglar
antaltrianglartotalt:: Int->Int
antaltrianglartotalt n=n+ antaltrianglar (trianglar n)

antaltrianglar:: [((Int,Int),Int)]->Int
antaltrianglar []=0
antaltrianglar xs=length xs

trianglar:: Int->[((Int,Int),Int)]
trianglar 1=[]
trianglar n=
  [((a,b),c)|a<-[1..n], b<-[1..n], c<-[1..n], c*c==a*a+b*b-a*b, a<b, c<b]

main = do putStr "Talet N ? "
          n <- readLn :: IO Int
          putStrLn $ "Antal trianglar " ++ show (antaltrianglartotalt n)

--Uppgift 3, talfamiljer
dec2int:: [Int]->Int
dec2int xs=foldl op 0 xs
   where op x y = 10*x + y
{-
alla:: [Int]->[[Int]]
alla xs|any (0==) xs = tabortnoll (permutations xs)
       |otherwise    = permutations xs

tabortnoll::(True, Int)->[[Int]]->[[Int]]
tabortnoll (True,a) xss=delete a xss 
tabortnoll (False,_) _ =error "No zeros were found!"

tabort::Int->[a]->[a]
tabort 0 xs =xs
tabort _ []=[]
tabort c xs=take (c-1) xs ++ reverse (take (length xs-c) (reverse xs))

noll::Int->[[Int]]->(Bool, [Int])
noll _ [[]]=(False, [])
noll k ((x:xs):xss)|x==0     =(True, (k-(length xss):strip (noll k xss)))
                   |otherwise=noll k xss
-}
strip::(Bool,[Int])->Int
strip (_,[])  =0
strip (_,x:xs)=x
--k är originallistans längd, konstant
