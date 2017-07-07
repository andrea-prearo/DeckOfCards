package com.aprearo.deckofcards

import org.junit.Before
import org.junit.Test
import kotlin.test.*

class DeckTests {
    private var deck: Deck? = null

    @Before
    fun setUp() {
        deck = Deck()
    }

    @Test
    fun testShuffle() {
        val cards1: List<Card> = deck!!.cards
        deck!!.shuffle()
        val cards2: List<Card> = deck!!.cards
        assertNotEquals(cards1, cards2)
    }

    @Test
    fun testDealOne() {
        val len0 = deck!!.size
        val card1 = deck!!.dealOne()
        val len1 = deck!!.size
        val card2 = deck!!.dealOne()
        val len2 = deck!!.size
        assertNotEquals(card1, card2)
        assertEquals(len0 - len1, 1)
        assertEquals(len1 - len2, 1)
    }

    @Test(expected = RuntimeException::class)
    fun testNoMoreCards() {
        val size = deck!!.size
        for (i in 0 until size) {
            deck!!.dealOne()
        }
        val card = deck!!.dealOne()
    }

    @Test
    fun testSameCard() {
        val card1 = deck!!.getCard(1)
        val card2 = deck!!.getCard(1)
        assertEquals(card1, card2)
        val card3 = Card(card1.suit, card1.rank)
        assertEquals(card1, card3)
    }

    @Test
    fun testDifferentCard() {
        val card1 = deck!!.getCard(1)
        val card2 = deck!!.getCard(2)
        assertNotEquals(card1, card2)
    }
}

