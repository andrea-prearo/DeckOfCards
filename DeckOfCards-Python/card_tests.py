import unittest
from card import Card, Suit, Rank


class TestCard(unittest.TestCase):

    def test_suit_count(self):
        self.assertEqual(Suit.count(), 4, 'A card must have 4 suits')

    def test_suit_instance(self):
        self.assertRaises(RuntimeError, Suit)

    def test_rank_count(self):
        self.assertEqual(Rank.count(), 13, 'A card must have 13 ranks')

    def test_rank_instance(self):
        self.assertRaises(RuntimeError, Rank)

    def test_unspecified_card(self):
        self.assertRaises(RuntimeError, Card, None, None)

    def test_invalid_suit(self):
        self.assertRaises(RuntimeError, Card, -1, Rank.five)
        self.assertRaises(RuntimeError, Card, Suit.count(), Rank.five)

    def test_invalid_rank(self):
        self.assertRaises(RuntimeError, Card, Suit.clubs, -1)
        self.assertRaises(RuntimeError, Card, Suit.clubs, Rank.count())

    def test_same_card(self):
        card1 = Card(Suit.diamonds, Rank.queen)
        card2 = Card(Suit.diamonds, Rank.queen)
        self.assertTrue(card1 == card2, 'Cards are different')


if __name__ == '__main__':
    unittest.main()
