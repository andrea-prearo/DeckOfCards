package com.aprearo.deckofcardstests

import org.specs2.mutable._
import org.specs2.matcher._
import com.aprearo.deckofcards._

class DeckTests extends Specification {

  "Deck" should {
    "shuffle all cards" in new deckScope {
      val cards1 = deck.cards
      deck.shuffle
      val cards2 = deck.cards
      cards1 mustNotEqual cards2
    }

    "remove dealt cards" in new deckScope {
      val len0 = deck.size
      val card1 = deck.dealOne
      val len1 = deck.size
      val card2 = deck.dealOne
      val len2 = deck.size
      card1 mustNotEqual card2
      len0 - len1 mustEqual 1
      len1 - len2 mustEqual 1
    }

    "stop dealing when there are no more cards" in new deckScope {
      Range(0, deck.size).foreach(_ => deck.dealOne)
      deck.dealOne must throwA(new RuntimeException("All cards have been dealt"))
    }

    "allow the inspect remaining cards" in new deckScope {
      val card1 = deck.getCard(0)
      val card2 = deck.getCard(0)
      card1 mustEqual card2
      val card3 = new Card(card1.suit, card1.rank)
      card1 mustEqual card3
      val card4 = deck.getCard(1)
      card4 mustNotEqual card1
    }
  }

}

trait deckScope extends Scope {
  lazy val deck = new Deck()
}
