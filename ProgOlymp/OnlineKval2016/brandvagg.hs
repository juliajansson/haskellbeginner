regel::Input->Bool
type Input=(IP, Port)
type IP=[Int]
type Port=Int

data IPv4=read "192.0.2.1" :: IPv4

toIPv4 :: [Int] -> IPv4
fromIPv4 :: IPv4 -> [Int]

görom::String->Input
görom []=([],0)
görom [a]=([],0)
görom as=fromIPv4 
    where (bs,cs)=sära as

sära::String->(String,String)
sära []=([],[])
sära (a:as)|head as==":"=(a,as)
           |otherwise   =merge (a,[]) (sära as)

merge::(String,String)->(String,String)->(String, String)
merge (a,[]) (b,c)=((a:b:[]),c)
{-  
continue::Int->String->Input
continue a []=a
continue a (b:bs)|head bs=="."=continueIP (10*a+b) bs
                 |head bs==":"=continuePort (10*a+b) bs
                 |otherwise   =continue (10*a+b) bs

continueIP::Int->String->Input
continueIP a []=a
-}
main=do
  n<-readLn
  ns<-sequence (replicate n getLine)
  k<-readLn
  k<-sequence (replicate k getLine)
  print (solution (tolka ns) (görom ks))
