require_relative 'spec_helper'
require './src/item'
require './src/author'
require './src/label'
require 'date'

describe Item do
  before :each do
    base_author = Author.new('first_name', 'last_name')
    base_genre = Genre.new('test genre')
    base_label = Label.new('The Label', 'The Color')
    @archivable_item = Item.new(
      'title',
      base_genre,
      base_author,
      'source',
      base_label,
      Date.new - (ONE_YEAR * 15)
    )
    @non_archivable_item = Item.new(
      'title',
      base_genre,
      base_author,
      'source',
      base_label,
      Date.new - (ONE_YEAR * 5)
    )
  end

  context 'Item Id is auto_increment' do
    it 'non_archivable_item and archivable_item has diferent ids' do
      expect(@archivable_item.id != @non_archivable_item).to be(true)
    end
  end

  context 'Item Id is auto_increment' do
    it 'archivable_item move_to_archive DOES archive the file' do
      test_archivable(@archivable_item, true)
    end

    it 'non_archivable_item move_to_archive DOES NOT archive the file' do
      test_archivable(@non_archivable_item, false)
    end
  end

  context "Author's Items list is add when item is constructed" do
    it "archivable_item's author has archivable_item in it's items list" do
      expect(@archivable_item.author.items.include?(@archivable_item)).to be(true)
    end
  end
end
