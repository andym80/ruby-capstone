require_relative 'spec_helper'

describe Author do
  before :each do
    @initial_author = Author.new('initial_author_first_name', 'initial_author_last_name')
    @final_author = Author.new('final_author_first_name', 'final_author_last_name')
    @base_genre = Genre.new('test genre')
    @base_label = Label.new('The Label', 'The Color')

    @base_item = Item.new(
      'title',
      @base_genre,
      @initial_author,
      'source',
      @base_label,
      DateTime.now - (60 * 60 * 24 * 365 * 15)
    )
  end

  context 'Initialization' do
    it 'initial_author has base_item' do
      expect(@initial_author.items.include?(@base_item)).to be(true)
    end

    it "final_author hasn't base_item" do
      expect(@final_author.items.include?(@base_item)).to be(false)
    end
  end

  context 'item can has only une author' do
    before :each do
      @final_author.add_item(@base_item)
    end

    it "initial_author hasn't base_item" do
      expect(@initial_author.items.include?(@base_item)).to be(false)
    end

    it 'final_author has base_item' do
      expect(@final_author.items.include?(@base_item)).to be(true)
    end
  end

  context 'author can have more that one item' do
    before :each do
      @other_item = Item.new(
        'title',
        @base_genre,
        @initial_author,
        'source',
        @base_label,
        DateTime.now - (60 * 60 * 24 * 365 * 15)
      )
    end

    it 'initial_author has base_item and other_item' do
      expect(@initial_author.items.include?(@base_item)).to be(true)
      expect(@initial_author.items.include?(@other_item)).to be(true)
    end
  end
end
