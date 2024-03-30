require_relative '../lib/Player'
require_relative '../lib/Card'

RSpec.describe Player do
  describe "#fold" do
      cards = [Card.new('H', 'A'), Card.new('S', 'K')]
      it "Player's hand should be cleared" do
          player = Player.new(100)
          player.get_cards(cards)
          player.fold
          expect(player.hand).to be_empty
      end
  end
end
