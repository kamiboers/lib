require 'pry'
require_relative 'word_finder'

class Scrabble

  attr_reader :word, :word_value

  def initialize(word=nil, value=0)
    @word = word
    @word_value = value
    reject_invalid(word)
    print_score
  end

  def score(word)
    0
  end

  def valid_word?(word)
    dictionary = WordFinder.new(word)
  end

  def reject_invalid(word)
    if valid_word?(word)
      point_values
      word_value(@word)
    else
      puts "Invalid Word"
    end
  end


  def point_values
    {
      "A"=>1, "B"=>3, "C"=>3, "D"=>2,
      "E"=>1, "F"=>4, "G"=>2, "H"=>4,
      "I"=>1, "J"=>8, "K"=>5, "L"=>1,
      "M"=>3, "N"=>1, "O"=>1, "P"=>3,
      "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
      "U"=>1, "V"=>4, "W"=>4, "X"=>8,
      "Y"=>4, "Z"=>10
    }
  end

  def word_value(word)

    score = score(word)
    standardize_case_of(word)

    word_value = word.chars.map do |character|
      score += point_values[character]
    end

    @word_value = score

  end

  def standardize_case_of(word)
    @word = word.upcase!
    binding.pry
    return @word
  end

  def print_score
    puts "Score: #{@word_value}"
  end

end

if __FILE__ == $0
scrabble_game = Scrabble.new("dog")
scrabble_game = Scrabble.new("kAMi")
scrabble_game = Scrabble.new("insensitivE")
scrabble_game = Scrabble.new("whatevs")
end
