import unittest
from deck import Deck


class TestDeck(unittest.TestCase):

    def setUp(self):
        self.deck = Deck()

    def test_shuffle(self):
        cards1 = self.deck.get_remaining_cards()
        # print self.deck
        self.deck.shuffle()
        cards2 = self.deck.get_remaining_cards()
        # print self.deck
        self.assertFalse(cards1 == cards2, 'Deck has not been shuffled')

    def test_deal_one(self):
        len0 = self.deck.size
        card1 = self.deck.deal_one()
        len1 = self.deck.size
        card2 = self.deck.deal_one()
        len2 = self.deck.size
        self.assertNotEqual(card1, card2, 'Card has already been dealt')
        self.assertTrue(len0 - len1 == 1, 'Dealt card has not been removed from the deck')
        self.assertTrue(len1 - len2 == 1, 'Dealt card has not been removed from the deck')

    def test_no_more_cards(self):
        for card in range(0, self.deck.size):
            self.deck.deal_one()
        self.assertRaises(RuntimeError, self.deck.deal_one)

if __name__ == '__main__':
    unittest.main()
