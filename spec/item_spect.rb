require_relative 'spec_helper'
require 'time'

describe Student do

  before :each do
		publish_date =
    @archevable_item = Item.new(
			1,
			'genre',
			'author',
			'source',
			'label',
			Time.now - (60*60*24*365*5),
			false
		)
    @non_archevable_item = Item.new()
			2,
			'genre',
			'author',
			'source',
			'label',
			Time.now - (60*60*24*365*15),
			false
		)
  end

	context "Item is archived if can be" do
		it "move_to_archive archive the file" do
			expect(archevable_item.archived).to be(false)
			archevable_item.move_to_archive
			expect(archevable_item.archived).to be(true)
		end
		it "non_archevable_item publish_date 2020, 10, 31" do
			expect(non_archevable_item.archived).to be(false)
			non_archevable_item.move_to_archive
			expect(non_archevable_item.archived).to be(false)

		end
	end
end
