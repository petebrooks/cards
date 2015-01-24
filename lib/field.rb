class Field

  # CLASS METHODS
  @@fields = []

  def self.add(field)
    @@fields << field
  end

  def self.create(text, tags=[])
    existing_field = self.find(text)
    if existing_field
      existing_field.tags = (existing_field.tags + tags).uniq
      return existing_field
    else
      Field.new(text, tags)
    end
  end

  def self.find(text)
    @@fields.find { |f| f.text == text }
  end

  # INSTANCE METHODS
  attr_accessor :text, :tags

  def initialize(text, tags=[])
    @text = text
    @tags = tags
    self.class.add(self)
  end

  def to_s
    text
  end

end