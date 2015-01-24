require "pry"
require_relative "field"

class Card
  # CLASS METHODS
  @@cards = []

  def self.add(card)
    @@cards << card
  end

  def self.all
    @@cards
  end

  # INSTANCE METHODS
  attr_reader :fields

  def initialize(field_text_1, field_text_2, tags=[])
    @fields = [Field.create(field_text_1, tags), Field.create(field_text_2, tags)]
    self.class.add(self)
  end

  def tags
    fields.map(&:tags).flatten.uniq
  end

  def to_s
    "#{fields.join(', ')}, #{tags}"
  end

end

# binding.pry