package com.aprearo.deckofcards

class Deck {
  var cards = List[Card]()

  Suit.values.foreach(suit =>
    Rank.values.foreach(rank =>
      cards = cards :+ new Card(suit, rank)
    )
  )

  def size: Int = { return cards.size }

  def shuffle = { cards = util.Random.shuffle(cards) }

  def dealOne: Card = {
    if (this.size == 0) {
      throw new RuntimeException("All cards have been dealt")
      return null
    }

    val card = cards.head
    cards = cards.tail
    return card
  }

  def getCard(index: Int): Card = {
    if ((index < 0) || (index > this.size - 1)) {
      throw new RuntimeException(s"Card index not contained in deck: ${index}")
      return null
    }

    return cards(index)
  }
}
