class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(find_song)
    all.detect{|song| song.name == find_song}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create_by_name(name)
  end

  def self.alphabetical
    all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    splitname = filename.split(" - ") 

    song = self.create
    song.name = splitname[1].chomp(".mp3")
    song.artist_name = splitname[0]
    song

  end

  def self.create_from_filename(filename)
    splitname = filename.split(" - ") 

    song = self.create
    song.name = splitname[1].chomp(".mp3")
    song.artist_name = splitname[0]
    song
  end

  def self.destroy_all
  all.clear
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
