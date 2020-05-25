defmodule Mix.Tasks.DeckOfCards.Play do
    use Mix.Task

    @shortdoc "Calls Game.play_with_deck/0."
    def run(_) do
        DeckOfCards.play_with_deck()
    end
end
