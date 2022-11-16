require 'rspec'
require_relative '../music_album'

RSpec.describe 'label' do
  it 'returns the correct label' do
    album = MusicAlbum.new('Nocturne', 'Chopin', 'source', 'classic', 1832, 'Y')
    expect(album.label).to eql 'Nocturne'
  end
end

describe 'author' do
  it 'returns the correct author' do
    album = MusicAlbum.new('Nocturne', 'Chopin', 'source', 'classic', 1832, 'Y')
    expect(album.author).to eql 'Chopin'
  end
end
