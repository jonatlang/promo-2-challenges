def sum_odd_indexed(array)
  sum = 0
  array.each_with_index { |num, index| sum += num if index.odd? }
  sum
end
 
def even_numbers(array)
  array.select { |num| num.even? }
end

def short_words(array, max_length)
  array.reject { |word| word.size > max_length }
end
 
def first_under(array, limit)
  array.find { |num| num < limit }  
end
 
def add_bang(array)
  array.map { |word| word + "!" }
end
 
def product(array)
  array.reduce(:*)  
end
 
def sorted_pairs(array)
  result = []
  array.each_slice(2) do |slice|
    result << slice.sort
  end
  result
end


