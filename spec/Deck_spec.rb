require_relative '../lib/Deck'

RSpec.describe Deck do
  describe '#initialize' do
    it 'creates deck of 52 cards' do
      deck = Deck.new
      expect(deck.cards.length).to eq(52)
    end
  end
end
