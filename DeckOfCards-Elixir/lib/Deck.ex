defmodule DeckOfCards.Deck do
    alias DeckOfCards.Card

    @type deck :: [Card]

    def new do
        for rank <- Card.ranks, suit <- Card.suits, do: %Card{suit: suit, rank: rank}
    end

    def shuffle(deck) do
        deck
        |> Enum.shuffle
    end

    def deal_all(deck) do
        deal(deck, Enum.count(deck), [])
    end

    def deal(deck, times) do
        deal(deck, times, [])
    end

    defp deal(deck, count, cards) when count === 0, do: {deck, cards}

    defp deal(deck, count, cards) do
        {card, deck} = deal_one(deck)
        deal(deck, count - 1, cards ++ List.wrap(card))
    end

    defp deal_one(deck) do
        List.pop_at(deck, Enum.count(deck) - 1)
    end
end
