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
  @@all << song
  song
end

def self.find_by_name(name)
  @@all.find do |song|
    song.name == name
  end
end

def self.find_or_create_by_name(name)
  if self.find_by_name(name)
    self.find_by_name(name)
  else
    self.create_by_name(name)
  end
end

def self.alphabetical
  @@all.sort_by{|song| song.name}
end

def self.new_from_filename(filename)
array = filename.chomp(".mp3").split(" - ")
song = Song.new
song.name = array[1]
song.artist_name = array[0]
song
end

def self.create_from_filename(filename)
array = filename.chomp(".mp3").split(" - ")
song = Song.new
song.name = array[1]
song.artist_name = array[0]
song.save
song
end

def self.destroy_all
@@all.clear
end

end
