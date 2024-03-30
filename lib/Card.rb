class Card
  #reads suits and values
  attr_reader :suit, :value

  # Initlazie
  def initialize(value, suit)
    @suit = suit
    @value = value
  end

 #show cards
  def to_s
    "#{@value} of #{@suit}"
  end

end
