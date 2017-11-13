#add requires
class Song < LibItem

  attr_reader :artist, :genre

  def initialize(name, artist = nil, genre = nil)
    super(name)
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.new_by_name(name)
    song = self.new(name)
  end

  def self.create_by_name(name)
    song = self.create(name)
  end

  def self.find_by_name(name)
    self.all.find { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    !!song ? song : self.create_by_name(name)
  end

  def self.new_from_filename(filename)
    name = filename.split(/-/)[1].strip
    artist = Artist.find_or_create_by_name(filename.split(/\s-\s/)[0].strip)
    genre = Genre.find_or_create_by_name(filename.split(/\s-\s/)[2].strip.gsub('.mp3', ''))
    song = Song.new(name, artist, genre)
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end

end
