defmodule DeckTest do
    alias DeckOfCards.Deck
    use ExUnit.Case

    test "shuffle" do
        deck = Deck.new()
        shuffled = deck
            |> Deck.shuffle

        refute deck.remaining == shuffled.remaining
        assert deck.used == []
        assert shuffled.used == []
    end

    test "deal one" do
        deck = Deck.new()
        new_deck = 
            deck |>
            Deck.deal(1)

        assert Enum.count(deck.remaining) == Enum.count(new_deck.remaining) + 1
        assert Enum.count(deck.used) == 0
        assert Enum.count(new_deck.used) == 1
    end

    test "deal many" do
        deck = Deck.new()
        new_deck = deck
            |> Deck.deal(5)

        assert Enum.count(deck.remaining) == Enum.count(new_deck.remaining) + 5
        assert Enum.count(deck.used) == 0
        assert Enum.count(new_deck.used) == 5
    end

    test "deal all" do
        deck = Deck.new()
        new_deck = deck
            |> Deck.deal_all

        assert Enum.count(deck.remaining) == 52
        assert Enum.count(new_deck.remaining) == 0
        assert Enum.count(deck.used) == 0
        assert Enum.count(new_deck.used) == 52
    end
end
