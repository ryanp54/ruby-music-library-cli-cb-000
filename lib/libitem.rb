class LibItem
  include Concerns::Sortable
  
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  @@all = []
  
  def self.all
    @@all
  end

  def self.destroy_all
    self.class.all.clear
  end

  def self.create(name)
    objekt = self.new(name)
    objekt.save
    objekt
  end

  def save
    self.class.all << self
  end

end
