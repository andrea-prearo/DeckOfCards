defmodule CardTest do
    alias DeckOfCards.Card
    use ExUnit.Case

    test "suit count" do
        assert Enum.count(Card.suits) == 4
    end

    test "rank count" do
        assert Enum.count(Card.ranks) == 13
    end

    test "card equality" do
        card1 = %Card{suit: "♣", rank: "A"}
        card2 = %Card{suit: "♣", rank: "A"}
        assert card1 == card2

        card3 = %Card{suit: "♣", rank: "Q"}
        refute card2 == card3
    end

    test "get suit" do
        Card.suits
        |> Enum.each(fn suit ->
                card = %Card{suit: suit, rank: "A"}
                assert card.suit == suit
                assert card.rank == "A"
            end
        )
    end

    test "get rank" do
        Card.ranks
        |> Enum.each(fn rank ->
                card = %Card{suit: "♣", rank: rank}
                assert card.suit == "♣"
                assert card.rank == rank
            end
        )
    end
end
