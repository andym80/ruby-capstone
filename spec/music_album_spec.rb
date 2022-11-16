require_relative './music_album'

describe '#title' do
  it 'returns the correct title' do
    album = MusicAlbum.new('Nocturne', 'Chopin')
    expect(album.title).to eql 'Nocturne'
  end
end

describe '#author' do
  it 'returns the correct author' do
    album = MusicAlbum.new('Nocturne', 'Chopin')
    expect(album.author).to eql 'Chopin'
  end
end
