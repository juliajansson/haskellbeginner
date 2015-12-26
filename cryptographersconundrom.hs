pa::(String,Int)->(String, Int)
pa ([],a)=([],a)
pa ((a:as), n)|a=='P'   =ea (as, n)
              |otherwise=ea (as, (n+1))

ea::(String,Int)->(String, Int)
ea ([],a)=([],a)
ea ((a:as), n)|a=='E'   =ra (as, n)
              |otherwise=ra (as, (n+1))

ra::(String,Int)->(String, Int)
ra ([],a)=([],a)
ra ((a:as), n)|a=='R'   =pa (as, n)
              |otherwise=pa (as, (n+1))

pera::String->Int
pera as=snd (pa (as,0))

--inte relevant för uppgiften
perifiera::String->String
perifiera []=[]
perifiera (a:b:c:[])="Per"
perifiera (a:b:c:as)="Per"++perifiera as

main =do
  ns<-getLine
  print (pera ns)
  
