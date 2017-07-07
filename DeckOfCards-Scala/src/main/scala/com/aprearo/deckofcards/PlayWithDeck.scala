package com.aprearo.deckofcards

object PlayWithDeck {
  def main(args: Array[String]) {
    val deck = new Deck()
    println("New deck ready.")
    deck.shuffle
    println("Shuffled deck.")
    Range(0, deck.size).foreach(i => println(s"Dealt: ${deck.dealOne.toString()}. ${i+1} card(s) dealt. ${deck.size} remaining."))
  }
}
