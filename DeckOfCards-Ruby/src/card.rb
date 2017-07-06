SUITS = %i[Hearts Clubs Diamonds Spades]
RANKS = %i[Ace Two Three Four Five Six Seven Eight Nine Ten Jack Queen King]

class Card
  attr_reader :suit, :rank

  def initialize(suit, rank)
    @rank = rank
    @suit = suit
  end

  def ==(another_card)
    suit == another_card.suit && rank == another_card.rank
  end

  def to_s
    "#{@rank} of #{@suit}"
  end

  def inspect
    "#<#{@rank} of #{@suit}>"
  end
end
