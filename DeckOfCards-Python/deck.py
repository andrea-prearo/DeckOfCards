from card import Card, Suit, Rank
from random import shuffle, randint


class Deck(object):

    def __init__(self):
        self.__dealt_cards = []
        self.__remaining_cards = []
        for suit in range(0, Suit.count()):
            for rank in range(0, Rank.count()):
                self.__remaining_cards.append(Card(suit, rank))

    @property
    def size(self):
        return len(self.__remaining_cards)

    def get_card(self, index):
        if 0 <= index <= self.size - 1:
            return self.__remaining_cards[index]
        else:
            raise RuntimeError('Card index not contained in deck: ' + index)

    def get_remaining_cards(self):
        return self.__remaining_cards[0:len(self.__remaining_cards)]

    def get_dealt_cards(self):
        return self.__dealt_cards[0:len(self.__dealt_cards)]

    def shuffle(self):
        shuffle(self.__remaining_cards)

    def deal_one(self):
        if self.size == 0:
            raise RuntimeError('All cards have been dealt')

        index = randint(0, self.size - 1)
        try:
            card = self.__remaining_cards[index]
            self.__dealt_cards.append(card)
            self.__remaining_cards.remove(card)
            return card
        except IndexError as e:
            raise RuntimeError('IndexError: {0} ({1})'.format(str(e), index))

    def __str__(self):
        string = ''
        count = 1
        size = self.size
        for card in self.__remaining_cards:
            string += 'Card {0} of {1}: {2}\n'.format(count, size, card)
            count += 1
        return string
