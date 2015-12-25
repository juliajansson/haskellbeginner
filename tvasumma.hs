main=do
  s<-getLine
  let [a,b]=words s
  print (add (read a) (read b))

add:: Int->Int->Int
add a b = a+b
