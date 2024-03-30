require_relative '../lib/Deck'
require_relative '../lib/Card'

class Hand
  def initialize(cards)
    @cards = cards
  end
  #tried to turn this into a if statment didnt work
  def evaluate
    #since it return i think i didnt nee if statment
    return :straight_flush if straight? && flush?
    return :four_of_a_kind if n_of_a_kind?(4)
    return :full_house if full_house?
    return :flush if flush?
    return :straight if straight?
    return :three_of_a_kind if n_of_a_kind?(3)
    return :two_pair if two_pair?
    return :pair if n_of_a_kind?(2)
    :high_card
  end

  def n_of_a_kind?(n)
    ranks_count.values.any? { |count| count == n }
  end
  #checks for striagnt
  def straight?
    sorted_ranks = @cards.map(&:rank).sort_by { |rank| Card::RANKS.index(rank) }
    (0..3).all? { |i| Card::RANKS.index(sorted_ranks[i + 1]) - Card::RANKS.index(sorted_ranks[i]) == 1 }
  end
  #checks for flush
  def flush?
    @cards.map(&:suit).uniq.size == 1
  end

  def full_house?
    ranks_count.values.sort == [2, 3]
  end

  def two_pair?
    ranks_count.values.count(2) == 2
  end

  def ranks_count
    @cards.group_by(&:rank).transform_values(&:count)
  end
end
#rspec failign ow well i give up
