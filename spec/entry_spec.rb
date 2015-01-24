require_relative '../lib/deck'
require_relative '../lib/card'

describe 'Card' do

  let(:card) { Card.new('manzana', 'apple', :noun) }

  describe '#initialize' do
    it "adds a card to the stack" do
      expect(Card.all).to include(card)
    end
  end

end

describe 'Deck' do

  let(:deck) { Deck.new('path/to/file.txt') }
  let(:card) { Card.new('manzana', 'apple', :noun) }

  describe "#add" do
    it "adds a card to the deck" do
      deck.add(card)
      expect(deck.cards).to include(card)
    end
  end

end