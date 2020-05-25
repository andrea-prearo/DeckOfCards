defmodule DeckOfCards.Deck do
    alias DeckOfCards.Card

    @type deck :: [Card]

    defstruct [:remaining, :used]

    def new do
        remaining = for rank <- Card.ranks, suit <- Card.suits, do: %Card{suit: suit, rank: rank}
        %{remaining: remaining, used: []}
    end

    def shuffle(%{remaining: remaining, used: used} = _) do
        shuffled = remaining
        |> Enum.shuffle
        %{remaining: shuffled, used: used}
    end

    def deal_all(%{remaining: remaining, used: _} = deck) do
        deal(deck, Enum.count(remaining))
    end

    def deal(%{remaining: remaining, used: _} = deck, _) when remaining === [], do: deck

    def deal(deck, count) do
        new_deck = deal_one(deck)
        deal(new_deck, count - 1)
    end

    defp deal_one(%{remaining: remaining, used: used} = _) do
        {card, new_remaining} = List.pop_at(remaining, Enum.count(remaining) - 1)
        %{remaining: new_remaining, used: used ++ List.wrap(card)}
    end
end
