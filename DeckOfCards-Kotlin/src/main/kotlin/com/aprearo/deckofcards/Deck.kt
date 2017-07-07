package com.aprearo.deckofcards

import java.lang.Math.random

class Deck() {
    var cards: MutableList<Card> = mutableListOf<Card>()
        private set
    var size: Int = 0
        get() = cards.size

    init {
        for (suit in enumValues<Suit>()) {
            for (rank in enumValues<Rank>()) {
                cards.add(Card(suit, rank))
            }
        }
    }

    fun shuffle() {
        val n = cards.size
        for (i in 0 until n) {
            val random = i + (random() * (n - i)).toInt()
            val randomCard = cards[random]
            cards[random] = cards[i]
            cards[i] = randomCard
        }
    }

    fun dealOne(): Card {
        if (size == 0) {
            throw RuntimeException("All cards have been dealt")
        }
        val card = cards.removeAt(0)
        return card
    }

    fun getCard(index: Int): Card {
        if (index < 0 || index >= cards.size) {
            throw RuntimeException("Card index not contained in deck: $index")
        }
        return cards[index]
    }

    override fun toString(): String {
        val builder = StringBuilder()
        for (i in 0 until size) {
            val card = cards[i]
            builder.append("Card $i of $size: $card\n")
        }
        return builder.toString()
    }
}
