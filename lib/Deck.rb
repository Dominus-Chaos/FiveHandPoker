require_relative 'Card'

class Deck
  attr_reader :cards

  # intialize cards and shuffles
  def initialize
    @cards = []
    build_deck
    shuffle!
  end

  # shuffles deck
  def shuffle!
    @cards.shuffle!
  end

  # builds a deck
  def build_deck

    suits = ['Hearts', 'Diamonds', 'Spades', 'Clubs']
    values = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace']

    # creates card with loop
    suits.each do |suit|
      values.each do |value|
        @cards << Card.new(suit, value)
      end
    end
  end
end
