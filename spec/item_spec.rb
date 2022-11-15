require_relative 'spec_helper'
require 'date'

describe Item do
  before :each do
    base_author = Author.new('first_name', 'last_name')

    @archivable_item = Item.new(
      'genre',
      base_author,
      'source',
      'label',
      DateTime.now - (60 * 60 * 24 * 365 * 15)
    )
    @non_archivable_item = Item.new(
      'genre',
      base_author,
      'source',
      'label',
      DateTime.now - (60 * 60 * 24 * 365 * 5)
    )
  end

  context 'Item Id is auto_increment' do
    it 'non_archivable_item and archivable_item has diferent ids' do
      expect(@archivable_item.id != @non_archivable_item).to be(true)
    end
  end

  context 'Item Id is auto_increment' do
    it 'archivable_item move_to_archive DOES archive the file' do
      expect(@archivable_item.archived).to be(false)
      @archivable_item.move_to_archive
      expect(@archivable_item.archived).to be(true)
    end

    it 'non_archivable_item move_to_archive DOES NOT archive the file' do
      expect(@non_archivable_item.archived).to be(false)
      @non_archivable_item.move_to_archive
      expect(@non_archivable_item.archived).to be(false)
    end
  end

  context "Author's Items list is add when item is constructed" do
    it "archivable_item's author has archivable_item in it's items list" do
      expect(@archivable_item.author.items.include?(@archivable_item)).to be(true)
    end
  end
end
