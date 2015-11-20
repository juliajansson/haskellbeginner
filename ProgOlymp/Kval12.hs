--Uppgift 1
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
          n <- readLn
          putStrLn $ "Antal trianglar" ++ show (antaltrianglar n)
--main får parse error
