import static org.junit.Assert.*;

import org.junit.Test;

import com.aprearo.deckofcards.*;

public class CardTests {
    @Test
    public void testSuitCount() {
        assertEquals(Card.Suit.values().length, 4);
    }

    @Test
    public void testRankCount() {
        assertEquals(Card.Rank.values().length, 13);
    }

    @Test
    public void testEquals() {
        Card card1 = new Card(Card.Suit.DIAMONDS, Card.Rank.QUEEN);
        Card card2 = new Card(Card.Suit.DIAMONDS, Card.Rank.QUEEN);
        assertEquals(card1, card2);
        Card card3 = new Card(Card.Suit.DIAMONDS, Card.Rank.ACE);
        assertNotEquals(card1, card3);
    }

    @Test
    public void testGetSuit() {
        Card.Suit[] suits = Card.Suit.values();
        int count = suits.length;
        for (int i=0; i < count; ++i) {
            Card card = new Card(suits[i], Card.Rank.ACE);
            assertEquals(card.getSuit(), suits[i]);
            assertEquals(card.getRank(), Card.Rank.ACE);
        }
    }

    @Test
    public void testGetRank() {
        Card.Rank[] ranks = Card.Rank.values();
        int count = ranks.length;
        for (int i=0; i < count; ++i) {
            Card card = new Card(Card.Suit.DIAMONDS, ranks[i]);
            assertEquals(card.getSuit(), Card.Suit.DIAMONDS);
            assertEquals(card.getRank(), ranks[i]);
        }
    }
}
