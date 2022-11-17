require_relative '../src/book'
require_relative '../src/author'
require './src/genre'
require_relative '../src/label'
require_relative '../src/item'
require 'date'
require 'json'
require 'securerandom'

describe Book do
    before :each do
			base_author = Author.new('first_name', 'last_name')
			base_genre = Genre.new('test genre')
			base_label = Label.new('The Label', 'The Color')

      @book = Book.new(
        'The Book',
        base_genre,
        base_author,
        'The Source',
        base_label,
        Date.today,
        'The Publisher'
      )
    end

  context 'Initialize' do
    it 'has a title' do
      expect(@book.title).to eq('The Book')
    end

    it 'has a publisher' do
      expect(@book.publisher).to eq('The Publisher')
    end

    it 'has a cover state' do
      expect(@book.cover_state).to eq('good')
    end

    it 'can be created' do
      expect(@book).to be_a(Book)
    end
  end

  context 'move_to_archive' do
    it 'can be archived' do
      @book.move_to_archive
      expect(@book.archived).to eq(false)
    end
  end
end
