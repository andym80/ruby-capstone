require './src/music_album'
require 'spec_helper'

def build_test_albun(publish_date_from_now, on_spotify)
  base_author = Author.new('first_name', 'last_name')
  base_genre = Genre.new('test genre')

  MusicAlbum.new(
    'title',
    base_genre,
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

	context "archivable" do
    before :each do
      @album = build_test_albun(ONE_YEAR * 15, true)
    end

		it "album most be archivable" do
			test_archivable(@album, true)
		end
	end

	context "non archivable" do
    before :each do
      @by_too_early = build_test_albun(ONE_YEAR * 5, true)
      @by_old_but_not_on_spotify = build_test_albun(ONE_YEAR * 15, false)
      @by_too_early_not_on_spotify = build_test_albun(ONE_YEAR * 5, false)
    end

		it "case: too early" do
			test_archivable(@by_too_early, false)
		end

		it "case: old but not on spotify" do
			test_archivable(@by_old_but_not_on_spotify, false)
		end

		it "case: too early and not on spotify" do
			test_archivable(@by_too_early_not_on_spotify, false)
		end
	end

end
