package com.aprearo.deckofcardstests

import org.specs2.mutable._
import com.aprearo.deckofcards._

class CardTests extends Specification {

  "Card" should {
    "have 4 suits" in {
      Suit.values must have size(4)
    }

    "have 13 ranks" in {
      Rank.values must have size(13)
    }

    "allow to test for equality" in {
      val card1 = new Card(Suit.Diamonds, Rank.Queen)
      val card2 = new Card(Suit.Diamonds, Rank.Queen)
      card1 mustEqual card2
    }

  }
}
