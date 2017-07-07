module DeckSpec (main, spec) where

import Test.Hspec
import Test.HUnit
import Deck
import Card
import Data.Maybe

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "shuffle" $ do
    it "should shuffle all cards" $ do
      let deck = mkDeck
      let cards1 = cards deck
      let deck' = shuffle deck
      let cards2 = cards deck'
      assertBool "card1 should differ from card2" (cards1 /= cards2)

  describe "dealOne" $ do
    it "should remove dealt cards" $ do
      let deck = mkDeck
      let len0 = size deck
      let (deck1, card1) = dealOne deck
      let len1 = size deck1
      let (deck2, card2) = dealOne deck1
      let len2 = size deck2
      assertBool "card1 should differ from card2" (fromJust card1 /= fromJust card2)
      (len0 - len1) `shouldBe` 1
      (len1 - len2) `shouldBe` 1

  describe "getCard" $ do
    it "should allow the inspect remaining cards" $ do
      let deck = mkDeck
      let card1 = getCard deck 0
      let card2 = getCard deck 0
      card1 `shouldBe` card2
      let card3 = Card (suit $ fromJust card1) (rank $ fromJust card1)
      (fromJust card1) `shouldBe` card3
      let card4 = getCard deck 1
      assertBool "card4 should differ from card1" (fromJust card4 /= fromJust card1)
