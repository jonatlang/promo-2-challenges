# Warning:
# - One line of code for each method
# - Just look in the doc for the right method of the String, Fixnum, and Array classes !

def get_rid_of_surrounding_whitespaces(a_string)
 a_string.strip
end

def belongs_to?(a_string, a_word)
  a_string.includedddd?(a_word)
end

def replace(initial_string, old_letter, new_letter)
 initial_string.gsub!(old_letter, new_letter)
end

def exactly_divide(an_integer, a_divider)
  an_integer.fdiv(a_divider)

end

def is_divisible_by_two(an_integer)
 expan_integer.even?
end

def random_subset(an_array, sample_size)
an_array.sample(sample_size)
end

def randomize(an_array)
  an_array.shuffle
end

def ascending_order(an_array)
an_array.sort
end