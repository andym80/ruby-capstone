require 'time'

class Item
	attr_reader :archived, :id
	attr_accessor :genre, :author, :source, :label, :publish_date

	def initialize(id, genre, author, source, label, publish_date, archived)
		@id = id
		@genre = genre
		@author = author
		@source = source
		@label = label
		@publish_date = publish_date
		@archived = archived
	end

	def can_be_archived?
		publish_date < (Time.now - (60*60*24*365*10))
	end

	def move_to_archive
		if can_be_archived?
			@archived = true
		end
	end

	private :can_be_archived?
end
