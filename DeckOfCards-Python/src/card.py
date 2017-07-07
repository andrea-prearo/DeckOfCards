class Suit:
    clubs = 0
    diamonds = 1
    hearts = 2
    spades = 3

    __suits = ['clubs', 'diamonds', 'hearts', 'spades']

    def __init__(self):
        raise RuntimeError('Suit is a static class \
            and does not allow to be instantiated')

    @staticmethod
    def count():
        return len(Suit.__suits)

    @staticmethod
    def str(suit):
        if suit not in range(0, Suit.count()):
            raise RuntimeError('Invalid rank')
        return Suit.__suits[suit]

class Rank:
    ace = 0
    two = 1
    three = 2
    four = 3
    five = 4
    six = 5
    seven = 6
    eight = 7
    nine = 8
    ten = 9
    jack = 10
    queen = 11
    king = 12

    __ranks = ['ace', 'two', 'three', 'four', 'five', 'six', 'seven',
               'eight', 'nine', 'ten', 'jack', 'queen', 'king']

    def __init__(self):
        raise RuntimeError('Rank is a static class \
            and does not allow to be instantiated')

    @staticmethod
    def count():
        return len(Rank.__ranks)

    @staticmethod
    def str(rank):
        if rank not in range(0, Rank.count()):
            raise RuntimeError('Invalid rank')
        return Rank.__ranks[rank]

class Card(object):

    def __init__(self, suit, rank):
        self.__suit = None
        self.__rank = None

        if suit is None or rank is None:
            raise RuntimeError('A card needs to specify a suit and a rank')

        self.suit = suit
        self.rank = rank

    @property
    def suit(self):
        return self.__suit

    @suit.setter
    def suit(self, suit):
        if suit not in range(0, Suit.count()):
            raise RuntimeError('Invalid suit')

        self.__suit = suit

    @property
    def rank(self):
        return self.__rank

    @rank.setter
    def rank(self, rank):
        if rank not in range(0, Rank.count()):
            raise RuntimeError('Invalid rank')

        self.__rank = rank

    def __str__(self):
        return '{0} of {1}'.format(
            Rank.str(self.rank),
            Suit.str(self.suit))

    def __key(self):
        return self.suit, self.rank

    def __eq__(self, other):
        return self.__key() == other.__key()

    def __hash__(self):
        return hash(self.__key())
