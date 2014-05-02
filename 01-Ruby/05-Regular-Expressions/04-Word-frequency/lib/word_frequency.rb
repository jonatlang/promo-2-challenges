def load_stop_words(stop_words_filename)
  File.open(stop_words_filename, "r").reduce(Array.new) { |stop_words, line| stop_words << line.chomp } 
end


def most_common_words(filename, stop_words_filename, number_of_word)
  counter = Hash.new(0)
  
  stop_words = load_stop_words(stop_words_filename)

  File.open(filename, "r").each_line do |line|
    line.chomp.downcase.split(/\W+/).each do |word|
      counter[word] += 1 unless stop_words.include? word
    end
  end

  Hash[counter.sort_by { |k, v| -v }[0..number_of_word-1]]
end