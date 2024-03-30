class Player
  attr_reader :name, :hand

  def initialize(name)
    @name = name
    @hand = nil
  end

  def receive_cards(cards)
    @hand = Hand.new(cards)
  end

  def show_hand
    puts "#{@name}'s hand: #{@hand}"
  end
end
