defmodule DeckOfCards.Card do
    @suits ~w[ ♣ ♦ ♥ ♠ ]
    @ranks ~w[ 2 3 4 5 6 7 8 9 10 J Q K A ]

    @enforce_keys [:suit, :rank]

    defstruct [:suit, :rank]

    def suits, do: @suits

    def ranks, do: @ranks
end
