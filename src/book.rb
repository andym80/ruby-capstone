class Book
  attr_accessor :publisher, :cover_state

  def initialize(publisher, cover_state)
    @publisher = publisher
    @cover_state = cover_state
  end

  def to_s
    "publisher: \"#{@publisher}\", cover_state: #{cover_state}"
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'publisher' => @publisher,
      'cover_state' => @cover_state
    }.to_json(*args)
  end

  def can_be_archived?
    @publish_date < (Date.now - (60 * 60 * 24 * 365 * 10))
  end

  private :can_be_archived?
end
