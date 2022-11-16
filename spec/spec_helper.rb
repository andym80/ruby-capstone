require './item'
require './src/author'

ONE_YEAR = 60 * 60 * 24 * 365

def test_archivable(item, expect)
  expect(item.archived).to be(false)
  item.move_to_archive
  expect(item.archived).to be(expect)
end
require './music_album'

RSpec.configure do |config|
  config.formatter = :documentation
end
