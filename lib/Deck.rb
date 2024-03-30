require_relative 'Card'

class Deck
  attr_reader :cards

  # intialize cards and shuffles
  def initialize
    @cards = []
    build_deck
    shuffle!
  end
end
