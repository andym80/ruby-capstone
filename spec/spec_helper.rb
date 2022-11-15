ONE_YEAR = 60 * 60 * 24 * 365

def test_archivable(item, expect)
  expect(item.archived).to be(false)
  item.move_to_archive
  expect(item.archived).to be(expect)
end

RSpec.configure do |config|
  config.formatter = :documentation
end
