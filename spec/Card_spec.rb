require_relative '../lib/Card'

RSpec.describe Card do
  let(:card) {Card.new('J', 'Spades')}
  it "intialized" do
    card = Card.new('J','Spades')

  end

  it 'reads suit' do
    expect(card.suit).to eq('Spades')
  end

  it 'reads the value' do
    expect(card.value).to eq('J')
  end

end
