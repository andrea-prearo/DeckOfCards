package com.arctouch.deckofcards

object Suit extends Enumeration {
  type Suit = Value
  val Clubs, Diamonds, Hearts, Spades = Value
}

object Rank extends Enumeration {
  type Rank = Value
  val Ace, Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King = Value
}

import Suit._
import Rank._

case class Card(suit: Suit, rank: Rank) {
  override def toString() = {
    s"${rank} of ${suit}"
  }
}
