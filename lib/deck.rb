require "pathname"
require_relative "card"

class Deck
  attr_reader :path

  def initialize(filepath)
    @path = Pathname.new(filepath)
    load_existing_entries if file_exists?
  end

  def cards
    @cards ||= []
  end

  def add(card)
    cards << card
    write(card)
  end

  def path=(filepath)
    @path = Pathname.new(filepath)
  end

  def to_s
    cards.map(&:to_s)
  end

  private

  def write(card)
    File.open(@path, 'a') { |f| f.puts card.to_s }
  end

  def file_exists?
    @path.exist? && !@path.zero?
  end

  def tagify(str)
    tags = []
    str.split(', ').each do |tag|
      tags << tag[/:\w+/]
    end
    tags
  end

  def load_existing_entries
    @path.readlines.each do |line|
      field1, field2, tag_string = line.chomp.split(', ')
      tags = tagify(tag_string)
      card = Card.new(field1, field2, tags)
      cards << card
    end
  end

end

while true
  puts "side 1:"
  f1 = gets.chomp
  puts "side 2:"
  f2 = gets.chomp
  puts "tags:"
  t = gets.chomp
  puts "-----------------------------------"
end