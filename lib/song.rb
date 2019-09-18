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
    self.all.detect{|song| song.name == find_song}
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
