require 'date'

class Date
  def self.parsable?(string)
    begin
      parse(string)
      true
    rescue ArgumentError
      false
    end
  end
end
