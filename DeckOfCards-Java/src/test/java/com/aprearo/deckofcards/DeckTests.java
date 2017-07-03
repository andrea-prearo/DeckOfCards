import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

import com.aprearo.deckofcards.*;

import java.util.ArrayList;

public class DeckTests {
    private Deck deck;

    @Before
    public void setUp() throws Exception {
        deck = new Deck();
    }

    @Test
    public void testShuffle() {
        ArrayList<Card> cards1 = new ArrayList<>(deck.getRemainingCards());
        deck.shuffle();
        ArrayList<Card> cards2 = new ArrayList<>(deck.getRemainingCards());
        assertNotEquals(cards1, cards2);
    }

    @Test
    public void testDealOne() {
        int len0 = deck.size();
        Card card1 = deck.dealOne();
        int len1 = deck.size();
        Card card2 = deck.dealOne();
        int len2 = deck.size();
        assertNotEquals(card1, card2);
        assertEquals(len0 - len1, 1);
        assertEquals(len1 - len2, 1);
    }

    @Test(expected=RuntimeException.class)
    public void testNoMoreCards() {
        int size = deck.size();
        for (int i=0; i < size; ++i) {
            deck.dealOne();
        }
        Card card = deck.dealOne();
    }

    @Test
    public void testSameCard() {
        Card card1 = deck.getCard(1);
        Card card2 = deck.getCard(1);
        assertEquals(card1, card2);
        Card card3 = new Card(card1.getSuit(), card1.getRank());
        assertEquals(card1, card3);
    }

    @Test
    public void testDifferentCard() {
        Card card1 = deck.getCard(1);
        Card card2 = deck.getCard(2);
        assertNotEquals(card1, card2);
    }
}
