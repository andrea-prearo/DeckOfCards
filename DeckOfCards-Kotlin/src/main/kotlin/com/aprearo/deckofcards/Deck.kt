package com.aprearo.deckofcards

import java.lang.Math.random

class Deck() {
    var remainingCards: MutableList<Card> = mutableListOf<Card>()
        private set
    var dealtCards: MutableList<Card> = mutableListOf<Card>()
        private set
    var size: Int = 0
        get() = remainingCards.size

    init {
        for (suit in enumValues<Suit>()) {
            for (rank in enumValues<Rank>()) {
                remainingCards.add(Card(suit, rank))
            }
        }
    }

    fun shuffle() {
        val n = remainingCards.size
        for (i in 0 until n) {
            val random = i + (random() * (n - i)).toInt()
            val randomCard = remainingCards[random]
            remainingCards[random] = remainingCards[i]
            remainingCards[i] = randomCard
        }
    }

    fun dealOne(): Card {
        if (size == 0) {
            throw RuntimeException("All cards have been dealt")
        }
        val card = remainingCards.removeAt(0)
        dealtCards.add(card)
        return card
    }

    fun getCard(index: Int): Card {
        if (index < 0 || index >= remainingCards.size) {
            throw RuntimeException("Card index not contained in deck: $index")
        }
        return remainingCards[index]
    }

    override fun toString(): String {
        val builder = StringBuilder()
        for (i in 0 until size) {
            val card = remainingCards[i]
            builder.append("Card $i of $size: $card\n")
        }
        return builder.toString()
    }
}
