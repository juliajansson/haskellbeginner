kommando::String->String
kommando []=[]
kommando [a]=[a]
kommando xs|r>g && r>b=('R':(kommando (drop r xs)))
           |g>r && g>b=('G':(kommando (drop g xs)))
           |b>r && b>g=('B':(kommando (drop b xs)))
  where r=nummer 'R' xs
        g=nummer 'G' xs
        b=nummer 'B' xs

nummer:: Eq a=> a->[a]->Int
nummer _ []              =0
nummer a [x]   |a==x     =1
               |otherwise=0
nummer a (x:xs)|a==x     =1
               |otherwise=1+(nummer a xs)

main=do
  n<-readLn
  s<-getLine
  putStrLn (take n (kommando s))
