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
    song = self.new
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    song.save
    song
  end

  def self.find_by_name(song_name)
    all.find { |song| song.name == song_name }
  end

  def self.find_or_create_by_name(song_name)
    song = find_by_name(song_name)
    song = create_by_name(song_name) if song.nil?
    song
  end

  def self.alphabetical
    sorted_songs = @@all.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)
    song = self.new
    parsed_filename = parse_filename(filename)
    song.name = parsed_filename[:title]
    song.artist_name = parsed_filename[:artist]
    song
  end

  def self.create_from_filename(filename)
    song = self.new
    parsed_filename = parse_filename(filename)
    song.name = parsed_filename[:title]
    song.artist_name = parsed_filename[:artist]
    song.save
    song
  end

  def self.destroy_all
    @@all.clear
  end

  private

  def self.parse_filename(filename)
    song_details = filename.split(" - ")
    song_title = song_details[1]
    song_artist = song_details[0]
    mod_title = File.basename(song_title, ".mp3")

    return { :artist => song_artist, :title => mod_title }
  end
end
