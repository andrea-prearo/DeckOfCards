from deck import Deck


def deal_a_card():
    card = deck.deal_one()
    print 'Dealt: {0}. {1} card(s) dealt. {2} remaining.'.format(
        card, len(deck.get_dealt_cards()), len(deck.get_remaining_cards()))


if __name__ == "__main__":
    deck = Deck()
    print 'New deck ready.'
    deck.shuffle()
    print 'Shuffled deck.'
    for suit in range(0, deck.size):
        deal_a_card()
