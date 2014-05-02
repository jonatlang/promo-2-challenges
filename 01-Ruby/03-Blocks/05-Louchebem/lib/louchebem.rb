# Encoding: utf-8

def louchebemize_word(word)
  random_suffix = %w(em é ji oc ic uche ès).shuffle.first
    
  if word.size == 1
    # do not translate one-letter word
    translation = word 
  elsif is_vowel? word[0]
    # word beginning with vowel
    translation = "l#{word}#{random_suffix}" # word beginning with vowel
  else
    # word beginning with 1 or more consonants
    first_vowel_index = word.split('').index { |letter| is_vowel? letter }
    beginning, ending = word[0..first_vowel_index-1],  word[first_vowel_index..word.size]
    translation = "l#{ending}#{beginning}#{random_suffix}"
  end
  translation
end

def is_vowel?(letter)
  %w(a e i o u).include? letter
end

def louchebemize(sentence)  
  # Read http://rubular.com/ bottom regex quick reference for help on regexes
  result_tokens = []
  words = sentence.split /\b/ # Split sentence into words with "any word boundary"
  
  words.each do |word|  
    if word.match /\W/  # \W stands for "any non-word character"
      result_tokens << word  # Keep non-word parts as-is
    else
      result_tokens << louchebemize_word(word)
    end
  end  
  
  result_tokens.join  # Build result sentence by joining tokens with space in-between.
end