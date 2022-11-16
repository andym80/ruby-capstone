require_relative '../src/author'
require 'date'
require 'json'
require_relative '../src/book'

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
