require './src/music_album'

def build_test_albun(publish_date_from_now, on_spotify)
  base_author = Author.new('first_name', 'last_name')

  MusicAlbum.new(
    'title',
    'genre',
    base_author,
    'source',
    'label',
    DateTime.now - publish_date_from_now,
    on_spotify
  )
end

describe MusicAlbum do
  context 'Initialization' do
    before :each do
      @album = build_test_albun(ONE_YEAR * 15, true)
    end

    it 'has on spotyfy true' do
      expect(@album.on_spotify).to be(true)
    end
  end
end
