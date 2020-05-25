defmodule DeckOfCards.Game do
    alias DeckOfCards.Deck

    def play_with_deck do
        final_deck = Deck.new
        |> log("New deck ready.")
        |> Deck.shuffle
        |> log("Shuffled deck.")
        |> Deck.deal_all

        final_deck.used
        |> Enum.each(&log/1)

        final_deck
        |> log("Shuffled all cards.")
    end

      defp log(deck, message) do
        IO.puts message
        deck
      end

      defp log(card) do
        IO.puts "Dealt: #{inspect card}."
      end
end

DeckOfCards.Game.play_with_deck()
