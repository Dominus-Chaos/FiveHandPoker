require_relative '../lib/player'
require_relative '../lib/hand'
require_relative '../lib/card'

RSpec.describe Player do
  let(:player_name) { "Alice" }
  let(:hand) { Hand.new([Card.new('Hearts', '10'), Card.new('Diamonds', 'J'), Card.new('Clubs', 'Q'), Card.new('Spades', 'K'), Card.new('Hearts', 'A')]) }
  let(:player) { Player.new(player_name) }

  describe '#initialize' do
    it 'creates a new player with the given name' do
      expect(player.name).to eq(player_name)
    end

    it 'initializes the hand as nil' do
      expect(player.hand).to be_nil
    end
  end

  describe '#receive_cards' do
    it 'sets the hand for the player' do
      player.receive_cards(hand.cards)
      expect(player.hand).to be_instance_of(Hand)
      expect(player.hand.cards.size).to eq(hand.cards.size)
    end
  end

  describe '#show_hand' do
    it 'displays the player\'s hand' do
      player.receive_cards(hand.cards)
      expect { player.show_hand }.to output("#{player_name}'s hand: #{hand}\n").to_stdout
    end
  end
end
