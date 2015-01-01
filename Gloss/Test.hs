import Graphics.Gloss

picture = pictures [text "Hello", circle 80]

myWindow = InWindow "Nice Window" (200, 200) (10, 10)
main = display myWindow white picture
 
