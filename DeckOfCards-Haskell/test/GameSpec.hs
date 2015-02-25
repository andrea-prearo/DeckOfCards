module GameSpec (main, spec) where

import Test.Hspec
import Game
import Deck
import Control.Monad.Writer

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "playGameRounds" $ do
    it "should stop dealing when there are no more cards" $ do
      let gs = runWriter $ playGameRounds (maxDeckSize+1)
      (card $ fst gs) `shouldBe` Nothing
