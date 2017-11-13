class LibCategory < LibItem
  extend Concerns::Findable

  attr_accessor :songs

  def initialize(name)
    super(name)
    @songs = []
  end

end
