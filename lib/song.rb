require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create #class constructor
    #initializes a song and saves to the @@all class variable
    song = self.new
    song.save
    song
  end

  def self.new_by_name(song_name) #class constructor
    #takes in the string name of a song and returns a Song instance
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name) #class constructor
    song = self.new
    song.name = song_name
    song.save
    song
  end

  def self.find_by_name(song_name) #class finder
    #accepts the song name and returns the matching instance
    self.all.detect {|s| s.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    #either return a matching song instance or create a new song 
    result = self.find_by_name(song_name)
    if result
      result
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    #use sort_by
    ascending_songs = @@all.sort_by { |song| song.name}
  end

  def self.new_from_filename(filename) #class constructor 
    songs = filename.split(" - ")
    songs[1] = songs[1].chomp(".mp3")
    song = self.new
    song.name = songs[1]
    song.artist_name = songs[0]
    song
  end

  def self.create_from_filename(filename) #class constructor
    result = self.new_from_filename(filename)
    song = self.create
    song.name = result.name
    song.artist_name = result.artist_name
    song
  end

  def self.destroy_all
    #deleting all previous song instances
    self.all.clear
  end

end
