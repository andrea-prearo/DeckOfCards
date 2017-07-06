class Deck
  attr_reader :cards

  def initialize
    @cards = []
    SUITS.product(RANKS) { |suit, rank| @cards << Card.new(suit, rank) }
  end

  def cards
    @cards.dup
  end

  def size
    @cards.count
  end

  def shuffle
    @cards.shuffle!
  end

  def deal_one()
    if @cards.count == 0
      raise RuntimeError, "All cards have been dealt", caller
    end
    @cards.shift
  end

  def get_card(index)
    if index < 0 || index >= @cards.count
      raise RuntimeError, "Card index not contained in deck: #{index}", caller
    end
    @cards[index]
  end

  def to_s
    builder = StringIO.new
    size = self.size
    for i in 0..size-1
      card = @cards[i]
      builder << "Card #{index} of #{@cards.count}: #{card}\n"
    end
    builder.string
  end
end
