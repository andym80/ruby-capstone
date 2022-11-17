require_relative '../src/book'
require_relative '../src/author'
require './src/genre'
require_relative '../src/label'
require_relative '../src/item'
require 'date'
require 'json'
require 'securerandom'

# disable: Metrics/ClassLength

describe Book do
  let(:book) { Book.new('The Book', 'The Publisher', 'The Author') }
  let(:author) { Author.new('The Author') }
  let(:label) { Label.new('The Label', 'The Color') }
  let(:item) { Item.new('The Item', 'The Publisher') }
  let(:genre) { Genre.new('The Genre') }
  let(:source) { Source.new('The Source') }
  let(:publish_date) { Date.new(2020, 1, 1) }
end

context 'Book' do
  it 'has a title' do
    expect(book.title).to eq('The Book')
  end

  it 'has a publisher' do
    expect(book.publisher).to eq('The Publisher')
  end

  it 'has a cover state' do
    expect(book.cover_state).to eq('The Cover State')
  end

  it 'can be created' do
    expect(book).to be_a(Book)
  end
end
