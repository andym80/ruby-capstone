require './item'

class MusicAlbum < Item
  attr_accesor :on_spotify, :id

  def initialize(on_spotify, *args)
    super(*args)
    @on_spotify = on_spotify
  end

  def self.list_music_album(albums)
    index = 1
    albums.each do |album|
      index += 1 if album.instance_of? MusicAlbum
    end
  end

  def self.add_music_album
    print 'Music Album: '
    title = gets.chomp
    print 'Artist: '
    artist = gets.chomp
    print 'Publish date(year): '
    publish_date = gets.chomp
    print 'Spotify (Y/N)'
    spotify = gets.chomp
    if spotify = 'Y'
        true
    else 
        false
    MusicAlbum.new(title, artist, publish_date, spotify)
  end

  def can_be_archived?
    super && @on_spotify
  end
end
