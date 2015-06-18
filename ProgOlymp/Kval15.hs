module Kval15 where

{- Uppgift 4: I den nyss avslutande tävling Databävern fick eleverna
se ett exempel på djurens märkliga samspel: En grupp på N bävrar ...

Tre kaninhål med djup mellan 1 och N-1 (där 2 < N < 10). Skriv ett
program som, givet hur raden ser ut efter att bävrarna passerat alla
hålen, beräknar djupet för varje hål.

Körningsexempel 1:
Antal bävrar? 5
Nummer? 3
Nummer? 4
Nummer? 2
Nummer? 1
Nummer? 5

Hålens djup: 1 1 2

-- Analys av exemplet:

startläge = [5, 4, 3, 2, 1]
-- bäver 1 faller ner i (och fyller) hål 1
efter_hål_1 = [1, 5, 4, 3, 2]
-- bäver 2 faller ner i (och fyller) hål 2
efter_hål_2 = [2, 1, 5, 4, 3]
-- bäver 3 faller ner i hål 3
-- bäver 4 faller ner i hål 3
-- bäver 4 dras upp ur hål 3
-- bäver 3 dras upp ur hål 3
efter_hål_3 = [3, 4, 2, 1, 5]

----------------
Körningsexempel 2:
Antal bävrar? 7
Nummer? 3
Nummer? 2
Nummer? 1
Nummer? 4
Nummer? 6
Nummer? 7
Nummer? 5

Hålens djup: 5 4 4
startläge = [7,6,5,4,3,2,1]
-- de fem första faller ner i hål 1
efter_hål_1 = reverse [5,4,3,2,1] ++ [7,6]
            = [1,2,3,4,5,7,6]
-- de fyra första faller ner i hål 2
efter_hål_2 = reverse [4,5,7,6] ++ [1,2,3]
            = [6,7,5,4,1,2,3]
-- de fyra första faller ner i hål 3
efter_hål_3 = reverse [4,1,2,3] ++ [6,7,5]
            = [3,2,1,4,6,7,5]
-}

-- Kör bävrarna "baklänges" över ett hål med djup d
-- Indata: d = djupet, bs = en lista av numrerade bävrar
-- Utdata: is = listan av bävrar innan hålet passerades

-- Exempel: d=4, bs = [3,2,1,4,6,7,5] ska ge is = [6,7,5,4,1,2,3]
-- hålet  = take d bs = [3,2,1,4]
-- resten = drop d bs = [6,7,5]
-- Egenskap: bs = take d bs ++ drop d bs
-- is = resten ++ reverse hålet
--kör_ett_hål_baklänges
k1hb:: Int -> Bävrar -> Bävrar
k1hb d bs = resten ++ reverse hålet
  where hålet  = take d bs
        resten = drop d bs
--kör_två_hål_baklänges

ds = [4,3]

type Djupen = [Int]
type Bävrar = [Int]

--kthb kör bävrarna baklänges över det båda hålen
k2hb :: Djupen -> Bävrar -> Bävrar
k2hb ds bs  = k1hb d1 (k1hb d2 bs)
  where
    --d1 visar djupet av det första hålet i en lista av två hål
    d1 :: Int
    d1 = ds!!0
    d2 :: Int
    d2 = ds!!1

--kthb kör bävrarna baklänges över det båda hålen
k3hb :: Djupen -> Bävrar -> Bävrar
k3hb ds bs  = k1hb (head ds) (k2hb (tail ds) bs)

ex1 :: [Int]
ex1 = [3,4,2,1,5]

kontroll :: Int -> Djupen -> Bävrar -> Bool
kontroll n ds bs = k3hb ds bs == reverse [1..n]

test1 = kontroll 5 [1,1,2] ex1

ex2 :: Bävrar
ex2 = [3, 2, 1, 4, 6, 7, 5]

test2 = kontroll 7 [5, 4, 4] ex2

{- Ett sätt att nu hitta listan med djup är att testa alla möjliga
listor av djup (mellan 1 och n-1) till någon passerar kontrollen. -}
