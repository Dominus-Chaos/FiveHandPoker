require_relative '../lib/Deck'

class Hand
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def evaluate
    if straight_flush?
      return :straight_flush
    elsif four_of_a_kind?
      return :four_of_a_kind
    elsif full_house?
      return :full_house
    elsif flush?
      return :flush
    elsif straight?
      return :straight
    elsif three_of_a_kind?
      return :three_of_a_kind
    elsif two_pair?
      return :two_pair
    elsif pair?
      return :pair
    else
      :high_card
    end
  end

  def straight_flush?
    flush? && straight?
  end

  def four_of_a_kind?
    group_by_value.values.any? { |group| group.length == 4 }
  end

  def full_house?
    group_by_value.values.map(&:length).sort == [2, 3]
  end

  def flush?
    cards.map(&:suit).uniq.length == 1
  end

  def straight?
    values = cards.map { |card| Card::VALUES.index(card.value) }.sort
    return false if values.include?(nil) # For Ace being both high and low
    (values.last - values.first) == 4 && values.uniq.length == 5
  end

  def three_of_a_kind?
    group_by_value.values.any? { |group| group.length == 3 }
  end

  def two_pair?
    group_by_value.values.count { |group| group.length == 2 } == 2
  end

  def pair?
    group_by_value.values.any? { |group| group.length == 2 }
  end

  def group_by_value
    cards.group_by(&:value)
  end
end
