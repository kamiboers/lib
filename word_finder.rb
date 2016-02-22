require 'pry'

class WordFinder

  def initialize(word)
    dictionary = File.read('/usr/share/dict/words').split("\n")
    dictionary.include?(word)
  end

end
