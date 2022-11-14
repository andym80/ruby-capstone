require_relative 'spec_helper'
require 'time'

describe Item do
  before :each do
    @archevable_item = Item.new(
      'genre',
      'author',
      'source',
      'label',
      Time.now - (60 * 60 * 24 * 365 * 15)
    )
    @non_archevable_item = Item.new(
      'genre',
      'author',
      'source',
      'label',
      Time.now - (60 * 60 * 24 * 365 * 5)
    )
  end

  context 'Item Id is auto_incremente' do
    it 'non_archevable_item and archevable_item has diferent ids' do
      expect(@archevable_item.id != @non_archevable_item).to be(true)
    end
  end

  context 'Item Id is auto_incremente' do
    it 'archevable_item move_to_archive DOES archive the file' do
      expect(@archevable_item.archived).to be(false)
      @archevable_item.move_to_archive
      expect(@archevable_item.archived).to be(true)
    end

    it 'non_archevable_item move_to_archive DOES NOT archive the file' do
      expect(@non_archevable_item.archived).to be(false)
      @non_archevable_item.move_to_archive
      expect(@non_archevable_item.archived).to be(false)
    end
  end
end
