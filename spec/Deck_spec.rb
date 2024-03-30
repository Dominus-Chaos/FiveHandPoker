require '../lib/Deck'

RSpec.describe Deck do
  let(:deck) { Deck.new }
#makes 52 cards
  describe "#initialize" do
    it "builds deck 52 cards" do
      expect(deck.cards.size).to eq(52)
    end
    #shuffles deck
    it "shuffles deck" do
      shuffled_deck = Deck.new.cards
      expect(shuffled_deck).not_to eq(deck.cards)
    end
  end

  describe "#deal" do
    it "deals specified number of cards" do
      dealt_cards = deck.deal(5)
      expect(dealt_cards.size).to eq(5)
    end
    #removes dealth cards from the deck so there not reused.
    it "removes dealt cards" do
      initial_deck_size = deck.cards.size
      dealt_cards = deck.deal(5)
      expect(deck.cards.size).to eq(initial_deck_size - 5)
      dealt_cards.each { |card| expect(deck.cards).not_to include(card) }
    end
  end
end
