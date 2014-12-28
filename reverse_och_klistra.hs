-- The name "reverse" is already taken.

revers :: [a] -> [a]
revers []     = []
revers (x:xs) = let ys = revers xs
                in klistra ys [x]
                   -- [x] == (x:[])
klistra :: [a] -> [a] -> [a]
klistra []      xs = xs
klistra (y:ys)  xs = y : klistra ys xs

{- Example computation of revers [1,2,3]
  revers [1,2,3]
== -- desugar list sytax
  revers (1:2:3:[])
== {- let x = 1; xs = 2:3:[] -}
  let ys = revers xs
  in klistra ys [x]
==   
  let ys = revers (2:3:[])
  in klistra ys [1]
==   
  let ys = revers (2:3:[])
  in klistra ys [1]
== -- Use rev2
  let ys = 3:[2]
  in klistra ys [1]
= -- simplify (splice in ys)
  klistra (3:[2]) [1]
= -- klistra (y:ys)  xs = y : klistra ys xs
  3 : klistra (2:[]) (1:[])
= -- klistra (y:ys)  xs = y : klistra ys xs
  3 : 2 : klistra [] (1:[])
= -- klistra [] is easy!
  3 : 2 : (1:[])
= -- list syntax sugar!
  [3,2,1]
-}

{- Computation rev2
  revers (2:3:[])
== {- let x = 2; xs = 3:[] -}
  let ys = revers xs
  in klistra ys [x]
== {- let x = 2; xs = 3:[] -}
  let ys = revers (3:[])
  in klistra ys [2]
== -- Use rev3 (below)
  let ys = [3]
  in klistra ys [2]
= -- simplify (splice in ys)
  klistra [3] [2]
= -- de-sugar list notation
  klistra (3:[]) [2]
= -- klistra (y:ys)  xs = y : klistra ys xs
  3 : klistra [] [2]
= -- klistra [] is easy
  3 : [2]
-}


{- computation rev3
  revers (3:[])
= {- let x = 3; xs = [] -}
  let ys = revers xs
  in klistra ys [x]
=
  let ys = revers []
  in klistra ys [3]
= -- revers [] = []
  let ys = []
  in klistra ys [3]
= -- simplify (splice in ys)
  klistra [] [3]
= -- klistra [] xs = xs  
  [3]

Thus: revers (3:[]) = [3]
-}

----------------------------------------------------------------

-- One way to understand recursion:
-- a collection of partially defined functions
-- revN is defined only for lists of length N
rev0, rev1, rev2, rev3 :: [a] -> [a]
rev0 [] = []
rev1 (x:xs) = klistra (rev0 xs) [x]
rev2 (x:xs) = klistra (rev1 xs) [x]
rev3 (x:xs) = klistra (rev2 xs) [x]
