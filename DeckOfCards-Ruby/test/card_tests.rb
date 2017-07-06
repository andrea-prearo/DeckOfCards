require File.expand_path '../../src/card.rb', __FILE__
require 'minitest/autorun'

class CardTests < Minitest::Test

  def test_suit_count
    assert_equal SUITS.count, 4
  end

  def test_rank_count
    assert_equal RANKS.count, 13
  end

  def test_equality
    card1 = Card.new(:Diamonds, :Queen)
    card2 = Card.new(:Diamonds, :Queen)
    assert_equal card1, card2
    card3 = Card.new(:Diamonds, :Ace)
    refute_equal card1, card3
  end

  def test_get_suit
    count = SUITS.count
    for i in 0..count-1
        card = Card.new(SUITS[i], :Ace)
        assert_equal card.suit, SUITS[i]
        assert_equal card.rank, :Ace
    end
  end

  def test_get_rank
    count = RANKS.count
    for i in 0..count-1
        card = Card.new(:Diamonds, RANKS[i])
        assert_equal card.suit, :Diamonds
        assert_equal card.rank, RANKS[i]
    end
  end

end
