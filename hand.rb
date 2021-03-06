require_relative 'card'
require_relative 'deck'

class Hand
  attr_reader :name
  attr_accessor :money

  BLACK_JACK = 21

  def initialize(name, money)
    @name = name
    @money = money
    @cards = []
    @card_opened = true
  end

  def take_card(deck)
    @cards << deck.distribution
  end

  def throw_cards
    @cards = []
  end

  def points
    sum = @cards.sum(&:weight)
    @cards.count(&:ace?).times {sum -= 10 if sum > BLACK_JACK}
    sum
  end

  def black_jack?
    points == BLACK_JACK
  end

  def overload?
    points > BLACK_JACK
  end

  def open_cards
    @card_opened = true
  end

  def close_cards
    @card_opened = false
  end

  def cards
    @card_opened ? @cards.join(' ') : ('* ' * @cards.size).strip
  end

  def three_cards?
    @cards.size == 3
  end

  def to_s
    s = "#{name}: #{cards}"
    s << ", #{points} points." if @card_opened
    s
  end
end
