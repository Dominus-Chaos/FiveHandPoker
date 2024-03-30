require_relative '../lib/Card'

class Deck
  attr_reader :cards

  def initialize
    @cards = init_deck.shuffle
  end

  def deal(num)
    cards.shift(num)
  end

  private
  #intialzie teh deck with suits and values
  def init_deck
    suits = ['Hearts', 'Diamonds', 'Clubs', 'Spades']
    values = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace']
    suits.product(values).map { |suit, value| Card.new(suit, value) }
  end
end
