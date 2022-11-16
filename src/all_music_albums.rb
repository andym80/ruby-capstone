require_relative 'music_album'

module AllMusicAlbums
  include PreserveData
  def list_albums(albums)
    albums.each do |album|
      puts "Title: #{album.title}, Author: #{album.author}"
    end
  end

  def create_album(albums)
    puts 'Title: '
    title = gets.chomp
    puts 'Author: '
    author = gets.chomp
    album = MusicAlbum.new(title, author)
    albums.push(album)
    album_data = { title: album.title, author: album.author }
    albums_storage = get_data('albums')
    albums_storage.push(album_data)
    data_upgrade('albums', albums_storage)
    puts 'Album created successfully'
  end
end
