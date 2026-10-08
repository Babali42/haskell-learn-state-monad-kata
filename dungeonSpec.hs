import Test.Hspec
import Control.Monad.State

data Item = Potion
  deriving (Eq, Show)

data GameState = GameState
  { health :: Int
  , gold :: Int
  , inventory :: [Item]
  } deriving (Eq, Show)

fightMonster :: State GameState ()
fightMonster = do
  modify (\s -> s { health = health s - 10 })

main :: IO ()
main = hspec $ do
  describe "Dungeon game" $ do
    it "fightMonster removes 10 health" $ do
      let initial = GameState 100 0 []
          result  = execState fightMonster initial

      health result `shouldBe` 90