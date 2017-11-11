class MusicLibraryController

  def initialize(path='./db/mp3s')
    controller = MusicImporter.new(path)
    controller.import
  end

  def call
    command = ""
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    while command != 'exit' do
      puts "What would you like to do?"
      command = gets.strip
    end
  end

  def list_songs
    out_order = Song.all.collect{ |song| song.name }.sort
    out_order.each_with_index do |song_name, i|
      song = Song.find_by_name(song_name)
      puts "#{i + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

end
