require '../lib/Hand'

RSpec.describe Hand do
  describe '#evaluate' do
    it 'returns :straight_flush' do
      hand = Hand.new([Card.new('Spades', '10'), Card.new('Spades', 'Jack'),
        Card.new('Spades', 'Queen'), Card.new('Spades', 'King'),
        Card.new('Spades', 'Ace')
      ])
      expect(hand.evaluate).to eq(:straight_flush)
    end

    it 'returns :four_of_a_kind if true' do
      hand = Hand.new([Card.new('Spades', '10'), Card.new('Diamonds', '10'),
        Card.new('Clubs', '10'), Card.new('Hearts', '10'),
        Card.new('Hearts', '2')
      ])
      expect(hand.evaluate).to eq(:four_of_a_kind)
    end

    it 'returns :full_house if true' do
      hand = Hand.new([Card.new('Hearts', '10'), Card.new('Diamonds', '10'),
        Card.new('Clubs', '10'), Card.new('Spades', '9'),
        Card.new('Hearts', '9')
    ])
    expect(hand.evaluate).to eq(:full_house)
  end

    it 'returns :flush if true' do
      hand = Hand.new([Card.new('Hearts', '10'), Card.new('Hearts', 'Jack'),
        Card.new('Hearts', 'Queen'), Card.new('Hearts', 'King'),
        Card.new('Hearts', '2')
      ])
      expect(hand.evaluate).to eq(:flush)
    end

    it 'returns :straight if true' do
      hand = Hand.new([Card.new('Diamonds', '10'), Card.new('Hearts', 'Jack'),
        Card.new('Hearts', 'Queen'), Card.new('Hearts', 'King'),
        Card.new('Hearts', 'Ace')
      ])
      expect(hand.evaluate).to eq(:straight)
    end

    it 'returns :straight if true' do
      hand = Hand.new([Card.new('Diamonds', '2'), Card.new('Hearts', '3'),
        Card.new('Hearts', '4'), Card.new('Hearts', '5'),
        Card.new('Hearts', 'Ace')
      ])
      expect(hand.evaluate).to eq(:straight)
    end

    it 'returns :three_of_a_kind if true' do
      hand = Hand.new([Card.new('Hearts', '10'), Card.new('Diamonds', '10'),
        Card.new('Clubs', '10'), Card.new('Spades', '9'),
        Card.new('Hearts', '8')
      ])
      expect(hand.evaluate).to eq(:three_of_a_kind)
    end

    it 'returns :two_pair if true' do
      hand = Hand.new([Card.new('Diamonds', '8'), Card.new('Diamonds', '8'),
        Card.new('Heart', '9'), Card.new('Spades', '9'),
        Card.new('Clubs', '3')
      ])
      expect(hand.evaluate).to eq(:two_pair)
    end

    it 'returns :pair if true' do
      hand = Hand.new([Card.new('Hearts', '10'), Card.new('Diamonds', '10'),
        Card.new('Clubs', '7'), Card.new('Spades', '9'),
        Card.new('Hearts', '8')
      ])
      expect(hand.evaluate).to eq(:pair)
    end
  end
end
