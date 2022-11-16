require_relative 'spec_helper'
require './src/game'
require 'date'

describe Game do
  def build_test_game(publish_date_from_now, multiplayer, last_played_at_from_now)
    base_author = Author.new('first_name', 'last_name')
		base_genre = Genre.new('test genre')

    Game.new(
      'title',
      base_genre,
      base_author,
      'source',
      'label',
      DateTime.now - publish_date_from_now,
      multiplayer,
      DateTime.now - last_played_at_from_now
    )
  end

  context 'archivable_games' do
    before :each do
      @archivable_game = build_test_game(ONE_YEAR * 15, true, ONE_YEAR * 3)
    end

    it 'archivable_game move_to_archive DOES archive the file' do
      test_archivable(@archivable_game, true)
    end
  end

  context 'non_archivable_games' do
    before :each do
      @non_archivable_game_by_publish_date = build_test_game(
        ONE_YEAR * 5,
        true,
        ONE_YEAR * 3
      )
      @non_archivable_game_by_last_played_at = build_test_game(
        ONE_YEAR * 15,
        true,
        ONE_YEAR * 1
      )
      @non_archivable_game_by_last_played_at_and_publish_date = build_test_game(
        ONE_YEAR * 5,
        true,
        ONE_YEAR * 1
      )
    end

    it 'non_archivable_game_by_publish_date move_to_archive DOES archive the file' do
      test_archivable(@non_archivable_game_by_publish_date, false)
    end

    it 'non_archivable_game_by_last_played_at move_to_archive DOES archive the file' do
      test_archivable(@non_archivable_game_by_last_played_at, false)
    end

    it 'non_archivable_game_by_last_played_at_and_publish_date move_to_archive DOES archive the file' do
      test_archivable(@non_archivable_game_by_last_played_at_and_publish_date, false)
    end
  end
end
