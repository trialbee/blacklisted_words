# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

# Seeds all bloacklisted words
%w(anabolic_steroids drugs ephedra unapproved_pharma weight_loss).each do |type|
  full_path = Rails.root.join('db', 'blacklisted_words', type) 
  File.open(full_path).read.each_line do |word|
    Word.create!(word_type: type, word: word.strip)
  end
end
