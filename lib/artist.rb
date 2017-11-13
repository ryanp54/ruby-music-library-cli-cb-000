#add requires
class Artist < LibItem
  extend Concerns::Findable

  attr_accessor :songs  
  @@all = []

  def self.all
    @@all
  end
  
  def initialize(name)
    super
    @songs = []
  end

  def add_song(song)
    song.artist = self unless song.artist
    self.songs << song unless self.songs.include?(song)
  end

  def genres
    self.songs.collect {|song| song.genre if song.genre }.uniq
  end

end
