require 'minitest/autorun'
require 'minitest/pride'
require_relative 'scrabble'

class ScrabbleTest < Minitest::Test
  def test_it_can_calculate_the_value_of_a_word
    scrabble_game = Scrabble.new("falafel")
    assert_equal 13, scrabble_game.word_value(scrabble_game.word)
  end

  def test_it_returns_zero_for_words_of_zero_length
    scrabble_game = Scrabble.new("")
    assert_equal 0, scrabble_game.word_value(scrabble_game.word)
  end

  def test_case_insensitivity_equals_yes
    scrabble_game = Scrabble.new("ABcdEFg")
    assert_equal "ABcdEFg".upcase, scrabble_game.standardize_case_of(scrabble_game.word)
  end

end
