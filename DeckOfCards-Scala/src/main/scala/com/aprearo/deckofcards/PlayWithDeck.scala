package com.aprearo.deckofcards

object PlayWithDeck {
  def main(args: Array[String]) {
    val deck = new Deck()
    println("New deck ready.")
    deck.shuffle
    println("Shuffled deck.")
    Range(0, 10).foreach(_ => println(s"Dealt: ${deck.dealOne.toString()}. ${deck.dealtCards.size} card(s) dealt. ${deck.size} remaining."))
  }
}
