import Data.Char (ord, chr)
--module Kval15 where

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
k1hb :: Int -> Bävrar -> Bävrar
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




{- Uppgift 6
Programmet ska fråga efter ett heltal N (1 ≤ N ≤ 10) – antalet operationer som magi-
tricket består av. Därefter ska det fråga efter var och en av de N operationerna. Varje
operation beskrivs med hjälp av två mellanslagsseparerade tecken. Det första tecknet
kommer att vara ett av ‘+’, ‘-’, ‘*’ och ‘/’, och beskriver operationen som utförs. Det andra
tecknet anger talet operationen utförs med, och kommer att vara antingen en siffra 0-9,
eller ett ‘x’. I det senare fallet ska du utföra operationen med talet som man ursprungli-
gen tänkte på i stället.
Du kommer aldrig få kommandot “/ x” eller “/ 0”.
Om magitricket fungerar, d.v.s. om man alltid får samma tal i slutet oavsett vad man
började med, och det talet dessutom är ett heltal, ska programmet skriva ut talet. I
annat fall ska det skriva ut “Nej”. Observera att det enbart är sluttalet som måste vara
ett heltal – tal som uppträder i uträkningen behöver inte vara det.

Körningsexempel 1
Antal operationer: 6
((((((x-1)*3)+9)/3)+5)-x)=7

Körningsexempel 2
Antal: 6
((((((x-1)*3)+9)/2)+5)-x)=Nej

Körningexempel 3
Antal: 6
((((((x+2)-x)*x)/2)+3)-x)=3

Körningsexempel 4
Antal: 5
(((((x+7)*x)*0)*x)-7)=-7

Körningsexempel 5
Antal: 1
(x*x)=Nej

Körningsexempel 6
Antal: 4
((((x*3)/3)-x)+5)=5

Körningsexempel 7
Antal operationer 3
(((x+1)-x)/2)=Nej
-}

-- antalOp :: Int
-- en operation bestr av: ett tecken (+, -, *, /) och (antingen en siffra eller "x")
-- (Tecken, KanskeSiffra)

type Operation = (Tecken, KanskeSiffra)
data Tecken = Plus | Minus | Gånger | Delat
data KanskeSiffra = Siffra Int | X
type Indata = [Operation]

op1 :: Operation
op1 = (Minus, Siffra 1)

op2 :: Operation
op2 = (Gånger, X)

exdata :: Indata
exdata = [op1, op2]
{-
beräknaI :: Indata -> (Rational -> Rational)
beräknaI ops i = error "snart!"
beräknaI [op] i = beräknaO op i
-}
beräknaO :: Operation -> (Rational -> Rational)
beräknaO (Minus,  Siffra s) x = x - fromIntegral s
beräknaO (Plus,   Siffra s) x = x + fromIntegral s
beräknaO (Gånger, Siffra s) x = x * fromIntegral s
beräknaO (Delat,  Siffra s) x = x / fromIntegral s

{-
bs :: [Int]
bs = [antalOp,op1,op2,op3,op4,op5,op6,op7,op8,op9,op10]

list :: [Int]
list = take (antalOp+1) bs

svar :: Int -> Int
svar = resultat1 | resultat1=heltal
       resultat1 | resultat1=resultat2
  	         else svar="Nej"

--resultat1 testas alla operationer med x=1 och resultat2 med x=2

resultat1 :: [Int] -> Int -> Int
resultat1 list 1 =

resultat2 :: [Int] -> Int -> Int
resultat2 list 2 =

-- if antalOp=10 then (op10(op9(op8(op7(op6(op5(op4(op3(op2(op1 x)
-}

{-
Gömda ord
Anna skickar hemliga krypterade meddelanden till Bert. För att kunna läsa meddelan-
dena måste Bert dekryptera dem med följande algoritm:
• Första bokstaven i indata-strängen tas med i utdatasträngen.
• Varje bokstav som man tar med beskriver var i indatasträngen nästa bokstav
finns som ska tas med. Ett ‘A’ betyder att nästa bokstav finns 1 position fram,
ett ‘B’ innebär 2 positioner fram osv.
• När man kommit till den sista bokstaven i indatasträngen så tar man med den
bokstaven och är klar. Indatan är sådan att man alltid kommer till den sista
bokstaven.
Hjälp Bert genom att skriva ett program som dekrypterar Annas meddelanden.
Programmet ska fråga efter den krypterade strängen (högst 50 tecken, versaler A-Z) och
skriva ut klartexten (den avkrypterade strängen). Strängen kommer kunna avkrypteras
med ovan beskrivna algoritm utan att man trillar över sista bokstaven.

indata:ABKBFA
utdata:ABBA

indata:HZBKRYAFEAAAAJ
utdata:HEJ
-}

encode :: [Char]->[Char]
encode (x:xs)=(x:a:b)
     where a=delist (next (biglet2int x) (x:xs))
           b=next (biglet2int a) xs

delist :: [a]->a
delist [x] = x

next :: Int->[Char]->[Char]
next a (y:x:xs)|a==0      = [x]
               |otherwise = next (a-1) xs

{-
encode "ABKBFA"=(x:a:b)=(A:delist(next(biglet2int A) "ABKBFA"):next (biglet2int a) xs)=(A:B:next(biglet2int B)"BKBFA"=(A:B:next 1 "BKBFA")=(A:B:next 0 "KBFA")=
-}
--next 1 [1,2]=[2]
--Wishful thinking!
{-
decipher::[Char]->[Char]
decipher []=[]
decipher [c]=[c]
decipher (a:b:bs)|biglet2int a==0 and biglet2int b==0=(a:b:decipher bs)
                 |biglet2int a==1=(a:decipher bs)
-}
--decipher "ABKBFA"=decipher (A:B:KBFA)=(A:B:decipher (K:B:FA))=(A:B

--int2Let (mod(biglet2int c+n)26)

int2Let :: Int -> Char
int2Let n = chr (ord 'A'+n)
biglet2int :: Char -> Int
biglet2int c = ord c - ord 'A'
