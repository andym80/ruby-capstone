require_relative 'spec_helper'
require './src/item'
require 'date'

describe Item do
  before :each do
    @archivable_item = Item.new(
      'genre',
      'author',
      'source',
      'label',
      DateTime.now - (ONE_YEAR * 15)
    )
    @non_archivable_item = Item.new(
      'genre',
      'author',
      'source',
      'label',
      DateTime.now - (ONE_YEAR * 5)
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
end
