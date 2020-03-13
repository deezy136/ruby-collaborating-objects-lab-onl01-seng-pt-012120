class Artist
  @@all = []
  attr_accessor :name


  def initialize(name)
    @name = name
    @songs = []
    save
  end

def save 
 @@all << self 
end 
  def self.all
    @@all    
  end
  
  def songs
      Song.all.select { |songs| 
   if songs.artist == self 
     @songs << songs.name 
     @songs
   else 
     nil 
   end 
   }
  end

      def add_song(song)
          song.artist = self 
         end 
  
  def self.find_or_create_by_name(name)
    self.find(name) ? self.find(name) : self.create(name)
  end

  def self.find(name)
    self.all.find {|artist| artist.name == name }
  end


  def self.create(name)
    self.new(name).tap {|artist| artist.save}
  end

 
  def print_songs
    songs.each {|song| puts song.name}
  end
end