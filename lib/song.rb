class Song
  attr_accessor :name, :artist

  @@all = []

  def initialize(name, artist=nil)
    @artist = artist 
    @name = name
   save
  end

def save 
     @@all << self  
end 

  def self.new_by_filename(file_name)
    song = file_name.split(" - ")[1]
    artist = file_name.split(" - ")[0]
    new_song = self.new(song)
    new_song.artist_name = artist
    new_song
    
  end


  def self.find_by_artist(artist)
    Song.all.select do | song |
      song.artist == artist
    end
  end
  
  def self.all
    @@all 
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
  end
  
end