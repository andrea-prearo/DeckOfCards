package com.arctouch.deckofcards

class Deck {
  var remainingCards = List[Card]()
  var dealtCards = List[Card]()

  Suit.values.foreach(suit =>
    Rank.values.foreach(rank =>
      remainingCards = remainingCards :+ new Card(suit, rank)
    )
  )

  def size: Int = { return remainingCards.size }

  def shuffle = { remainingCards = util.Random.shuffle(remainingCards) }

  def dealOne: Card = {
    if (this.size == 0) {
      throw new RuntimeException("All cards have been dealt")
      return null
    }

    val card = remainingCards.head
    remainingCards = remainingCards.tail
    dealtCards = dealtCards :+ card
    return card
  }

  def getCard(index: Int): Card = {
    if ((index < 0) || (index > this.size - 1)) {
      throw new RuntimeException(s"Card index not contained in deck: ${index}")
      return null
    }

    return remainingCards(index)
  }
}
