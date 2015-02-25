module CardSpec (main, spec) where

import Test.Hspec
import Card

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "Type" $ do
    it "should allow to test for equality" $ do
      let card1 = Card Diamonds Queen
      let card2 = Card Diamonds Queen
      card1 `shouldBe` card2
  describe "Suit" $ do
    it "should have 4 possible values" $ do
      length [Clubs .. Spades] `shouldBe` 4
  describe "Rank" $ do
    it "should have 13 possible values" $ do
      length [Ace .. King] `shouldBe` 13
