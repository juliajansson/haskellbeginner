module SkinnyTree where
import Graphics.Gloss

edge :: Float
edge = 40

trunk :: Picture
trunk = line [(0, 0), (0, edge)]

tree :: Int -> Picture
tree 0 = trunk
tree n = let  smallerTree = scale 0.8 0.8 (tree (n-1))
         in Pictures [ trunk
                     , onTrunk  $  rotate (-15) smallerTree
                     , onTrunk  $  rotate   20  smallerTree
                     ]

onTrunk :: Picture -> Picture
onTrunk = Translate 0 edge

picture :: Picture
picture = tree 10

myWindow :: Display
myWindow = InWindow "Nice Window" (500, 500) (10, 10)

main :: IO ()
main = display myWindow white picture
