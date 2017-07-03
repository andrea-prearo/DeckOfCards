package com.aprearo.deckofcards

import org.junit.Test
import kotlin.test.*

class CardTests {
    @Test
    fun testSuitCount() {
        assertEquals(Suit.values().size, 4)
    }

    @Test
    fun testRankCount() {
        assertEquals(Rank.values().size, 13)
    }

    @Test
    fun testEquals() {
        val card1 = Card(Suit.DIAMONDS, Rank.QUEEN)
        val card2 = Card(Suit.DIAMONDS, Rank.QUEEN)
        assertEquals(card1, card2)
        val card3 = Card(Suit.DIAMONDS, Rank.ACE)
        assertNotEquals(card1, card3)
    }

    @Test
    fun testGetSuit() {
        val suits = enumValues<Suit>()
        val count = suits.size
        for (i in 0 until count) {
            val card = Card(suits[i], Rank.ACE)
            assertEquals(card.suit, suits[i])
            assertEquals(card.rank, Rank.ACE)
        }
    }

    @Test
    fun testGetRank() {
        val ranks = enumValues<Rank>()
        val count = ranks.size
        for (i in 0 until count) {
            val card = Card(Suit.DIAMONDS, ranks[i])
            assertEquals(card.suit, Suit.DIAMONDS)
            assertEquals(card.rank, ranks[i])
        }
    }
}
