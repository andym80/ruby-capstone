require_relative './item'
require 'securerandom'

class Genre
  attr_accessor :id, :name, :items

	def initialize(name)
		@id = SecureRandom.random_number(1000)
		@name = name
		@items = []

	end

	def add_item(item)
		@items << item
		item.self = self
	end
end
