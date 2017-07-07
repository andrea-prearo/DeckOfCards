package com.aprearo.deckofcards

fun main(args: Array<String>) {
    val deck = Deck()
    println("New deck ready.")
    deck.shuffle()
    println("Shuffled deck.")
    val size = deck.size
    for (i in 0 until size) {
        val card = deck.dealOne()
        println(
            "Dealt: $card. ${i+1} card(s) dealt. ${deck.size} remaining.")
    }
}
