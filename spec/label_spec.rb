require 'securerandom'
require 'date'
require_relative '../src/label'
require_relative '../src/item'
require 'json'

describe Label do
  let(:label) { Label.new('The Label', 'The Color') }
  let(:item) { Item.new('The Item', 'The Publisher') }

  context 'Label' do
    it 'has a title' do
      expect(label.title).to eq('The Label')
    end

    it 'has a color' do
      expect(label.color).to eq('The Color')
    end

    it 'can be created' do
      expect(label).to be_a(Label)
    end
  end
end

def to_json(*args)
  {
    JSON.create_id => self.class.name,
    'title' => @title,
    'color' => @color,
    'id' => @id
  }.to_json(*args)
end
