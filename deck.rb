require_relative('card')

class Deck
  attr_accessor :cards

  def initialize
    @cards = []
    Card::SUITS.each do |suit|
      Card::VALUES.each { |value| @cards << Card.new(suit, value) }
    end
  end

#перетасовка колоды
  def mix
    @cards.shuffle!
  end

#выдача одной карты и автоматическое удаление из колоды
  def distribution
    @cards.shift
  end
end
