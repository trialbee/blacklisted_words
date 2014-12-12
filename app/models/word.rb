class Word < ActiveRecord::Base
  def self.blacklisted_words_in(string, type = nil)
    blacklisted_words = []
    words = type.nil? ? all : where(word_type: type)
    words.each do |word|
      blacklisted_words << word.word if string.include?(word.word)
    end
    blacklisted_words
  end
end
