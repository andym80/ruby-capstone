require_relative 'spec_helper'
require './src/game'
require 'date'

describe Game do
  before :each do
    @archivable_game = Game.new(
      'genre',
      'author',
      'source',
      'label',
      DateTime.now - (ONE_YEAR * 15),
			true,
			DateTime.now - (ONE_YEAR * 3)
    )
    @non_archivable_game_by_publish_date = Game.new(
      'genre',
      'author',
      'source',
      'label',
      DateTime.now - (ONE_YEAR * 5),
			true,
			DateTime.now - (ONE_YEAR * 3)
    )
    @non_archivable_game_by_last_played_at = Game.new(
      'genre',
      'author',
      'source',
      'label',
      DateTime.now - (ONE_YEAR * 15),
			true,
			DateTime.now - (ONE_YEAR * 1)
    )
    @non_archivable_game_by_last_played_at_and_publish_date = Game.new(
      'genre',
      'author',
      'source',
      'label',
      DateTime.now - (ONE_YEAR * 5),
			true,
			DateTime.now - (ONE_YEAR * 1)
    )
  end
  context 'archivable_games' do
    it 'archivable_game move_to_archive DOES archive the file' do
      expect(@archivable_game.archived).to be(false)
			@archivable_game.move_to_archive
      expect(@archivable_game.archived).to be(true)
    end

    it 'non_archivable_game_by_publish_date move_to_archive DOES archive the file' do
      expect(@non_archivable_game_by_publish_date.archived).to be(false)
			@non_archivable_game_by_publish_date.move_to_archive
      expect(@non_archivable_game_by_publish_date.archived).to be(false)
    end

    it 'non_archivable_game_by_last_played_at move_to_archive DOES archive the file' do
      expect(@non_archivable_game_by_last_played_at.archived).to be(false)
			@non_archivable_game_by_last_played_at.move_to_archive
      expect(@non_archivable_game_by_last_played_at.archived).to be(false)
    end

    it 'non_archivable_game_by_last_played_at_and_publish_date move_to_archive DOES archive the file' do
      expect(@non_archivable_game_by_last_played_at_and_publish_date.archived).to be(false)
			@non_archivable_game_by_last_played_at_and_publish_date.move_to_archive
      expect(@non_archivable_game_by_last_played_at_and_publish_date.archived).to be(false)
    end
  end

end
