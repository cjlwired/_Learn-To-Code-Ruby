# Problem 17
# Number Letter Counts

require 'numbers_and_words'

# Use 'Numbers and Words' gem.
def num_to_words(number)
  word = I18n.with_locale(:en) { number.to_words }
end

# Sanitize string and take into account presence of 'and'.
def get_length(word)
  and_addition = word.include?(" hundred ") ? 3 : 0
  clean_word    = word.gsub(/\s|-/,"")

  clean_word.length + and_addition
end

# Collect total letter count up to max_num.
def count_letters(max_num)
  (1..max_num).collect { |n| get_length(num_to_words(n)) }.inject(:+)
end

puts "Letter Count up to 1000 = #{count_letters(1000)}"
