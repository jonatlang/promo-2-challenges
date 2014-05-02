require 'open-uri'
require 'json'

def generate_grid(grid_size)
  Array.new(grid_size) { ('A'..'Z').to_a[rand(26)] }
end


def is_included?(guess, grid)
  guess.split("").all?{ |letter| grid.include? letter }
end

def compute_score(attempt, time_taken)
  (time_taken > 60.0) ? 0 : attempt.size * (1.0 - time_taken / 60.0) 
end

def run_game(attempt, grid, start_time, end_time)
  result = { time: end_time - start_time, score: 0 }
    
  result[:translation] = get_translation(attempt)
  
  unless result[:translation]
    result[:message] = "not an english word"
  else
    if is_included?(attempt.upcase, grid) 
      result[:score] = compute_score(attempt, result[:time]) 
      result[:message] = "well done"
    else
      result[:message] = "not in the grid"
    end
  end
    
  result
end


def get_translation(word)
  response = open("http://api.wordreference.com/0.8/80143/json/enfr/#{word.downcase}")
  json = JSON.parse(response.read.to_s)
  json['term0']['PrincipalTranslations']['0']['FirstTranslation']['term'] unless json["Error"]
end

