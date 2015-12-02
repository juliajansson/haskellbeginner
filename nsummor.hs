main=do
  n<-getLine
  s<-getLine
  print (sum (f s))

f::String->[Int]
f s=map read (words s)
