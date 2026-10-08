import Test.Hspec
import Control.Monad.State

data Item = Item
  deriving (Eq, Show)

data GameState = GameState
  { health :: Int
  , gold :: Int
  , inventory :: [Item]
  } deriving (Eq, Show)

fightMonster :: State GameState ()
fightMonster = do
  modify (\s -> s { health = health s - 10 })

findTreasure :: State GameState ()
findTreasure = do
  modify (\s -> s { gold = gold s + 100 })

pickUpPotion :: State GameState ()
pickUpPotion = do
  let potion = Item
  modify (\s -> s { inventory = inventory s ++ [potion] })  

main :: IO ()
main = hspec $ do
  describe "Dungeon game" $ do
    it "fightMonster removes 10 health" $ do
      let initial = GameState 100 0 []
          result  = execState fightMonster initial

      health result `shouldBe` 90

    it "findTreasure add 100 money" $ do
      let initial = GameState 100 0 []
          result  = execState findTreasure initial

      gold result `shouldBe` 100

    it "pick up a potion add item to the inventory" $ do
      let initial = GameState 100 0 []
          item = Item
          result = execState pickUpPotion initial

      inventory result `shouldBe` [item]