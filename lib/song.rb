class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

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
    song = Song.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    all.find { |song| song.name.eql?(name) }
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create_by_name(name)
  end

  def self.alphabetical
    all.sort_by(&:name)
  end

  def self.new_from_filename(filename)
    song = new_by_name(filename[/(?<=- )(.*)(?=\.)/])
    song.artist_name = filename[/\w+(?= -)/]
    song
  end

  def self.create_from_filename(filename)
    song = create_by_name(filename[/(?<=- )(.*)(?=\.)/])
    song.artist_name = filename[/\w+(?= -)/]
    song
  end

  def self.destroy_all
    all.clear
  end
end
