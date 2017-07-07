from deck import Deck

if __name__ == "__main__":
    deck = Deck()
    print 'New deck ready.'
    deck.shuffle()
    print 'Shuffled deck.'
    for i in range(0, deck.size):
        card = deck.deal_one()
        print 'Dealt: {0}. {1} card(s) dealt. {2} remaining.'.format(
            card, i+1, len(deck.cards))
