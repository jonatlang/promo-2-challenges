# Encoding: utf-8
require 'csv'

def most_successfull(number, max_year, filename)
  all_movies = load_movies(filename)
  filtered_movies = all_movies.select{ |movie| movie[:year] < max_year}.sort_by{ |movie| -movie[:earnings] }
  filtered_movies.take(number)
end


def load_movies(filename)
  movies = []
  CSV.foreach(filename, encoding: "ISO8859-1") do |row|
    movies << {name: row[0], year: row[1].to_i, earnings: row[2].to_i}
  end
  movies
end