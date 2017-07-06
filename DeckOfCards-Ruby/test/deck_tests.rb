require File.expand_path '../../src/deck.rb', __FILE__
require File.expand_path '../../src/card.rb', __FILE__
require 'minitest/autorun'

class DeckTests < Minitest::Test

  def setup
    @deck = Deck.new
  end

  def test_shuffle
    cards1 = @deck.cards
    @deck.shuffle
    cards2 = @deck.cards
    refute_equal cards1, cards2
  end

  def test_deal_one
    len0 = @deck.size
    card1 = @deck.deal_one
    len1 = @deck.size
    card2 = @deck.deal_one
    len2 = @deck.size
    refute_equal card1, card2
    assert_equal len0 - len1, 1
    assert_equal len1 - len2, 1
  end

  def test_no_more_cards
    size = @deck.size
    for i in 0..size-1
      @deck.deal_one
    end
    assert_raises(RuntimeError) { @deck.deal_one }
  end

  def test_same_card
    card1 = @deck.get_card 1
    card2 = @deck.get_card 1
    assert_equal card1, card2
    card3 = Card.new card1.suit, card1.rank
    assert_equal card1, card3
  end

  def test_different_card
      card1 = @deck.get_card 1
      card2 = @deck.get_card 2
      refute_equal card1, card2
  end

end
