package com.aprearo.deckofcards

enum class Suit(val value: String) {
    CLUBS("Clubs"), DIAMONDS("Diamonds"), HEARTS("Hearts"), SPADES("Spades")
}

enum class Rank(val value: String) {
    ACE("Ace"), TWO("Two"), THREE("Three"), FOUR("Four"), FIVE("Five"), SIX("Six"), SEVEN("Seven"),
    EIGHT("Eight"), NINE("Nine"), TEN("Ten"), JACK("Jack"), QUEEN("Queen"), KING("King")
}

class Card constructor(val suit: Suit, val rank: Rank) {
    override fun toString() = "${rank.value} of ${suit.value}"

    override fun equals(other: Any?): Boolean {
        if (other is Card) {
            return suit == other.suit && rank == other.rank
        }
        return false
    }
}
