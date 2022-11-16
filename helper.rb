require 'date'

class Date
  def self.parsable?(string)
    parse(string)
    true
  rescue ArgumentError
    false
  end
end
