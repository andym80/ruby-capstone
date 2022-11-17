require 'securerandom'
require 'date'
require_relative '../src/label'
require_relative '../src/item'
require 'json'

describe Label do
  def build_test_label
    before :each do
      @label = Label.new('test label', 'test color')
    end
  end

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
