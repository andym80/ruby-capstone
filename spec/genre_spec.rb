require_relative 'spec_helper'

describe Genre do
  before :each do
    @base_author = Author.new('initial_author_first_name', 'initial_author_last_name')
    @initial_genre = Genre.new('initial genre')
    @final_genre = Genre.new('final genre')
    @base_label = Label.new('The Label', 'The Color')

    @base_item = Item.new(
      'title',
      @initial_genre,
      @base_author,
      'source',
      @base_label,
      DateTime.now - (60 * 60 * 24 * 365 * 15)
    )
  end

  context 'Initialization' do
    it 'initial_genre has base_item' do
      expect(@initial_genre.items.include?(@base_item)).to be(true)
    end

    it "final_author hasn't base_item" do
      expect(@final_genre.items.include?(@base_item)).to be(false)
    end
  end

  context 'item can has only une author' do
    before :each do
      @final_genre.add_item(@base_item)
    end

    it "initial_genre hasn't base_item" do
      expect(@initial_genre.items.include?(@base_item)).to be(false)
    end

    it 'final_genre has base_item' do
      expect(@final_genre.items.include?(@base_item)).to be(true)
    end
  end

  context 'genre can have more that one item' do
    before :each do
      @other_item = Item.new(
        'title',
        @initial_genre,
        @base_author,
        'source',
        @base_label,
        DateTime.now - (60 * 60 * 24 * 365 * 15)
      )
    end

    it 'initial_author has base_item and other_item' do
      expect(@initial_genre.items.include?(@base_item)).to be(true)
      expect(@initial_genre.items.include?(@other_item)).to be(true)
    end
  end
end
