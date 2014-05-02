# NOTE: Read about BasicObject#object_id
# http://www.ruby-doc.org/core-2.1.1/BasicObject.html#method-i-__id__

# You can try launching `irb` to test some values
# irb> :foo.object_id
# irb> :foo.object_id
# irb> "foo".object_id
# irb> "foo".object_id

def are_identical_symbols_same_objects?
  true
end

def are_identical_strings_same_objects?
  false
end


# Remember, RTFM! Your doc is your friend
# - http://www.ruby-doc.org/core-2.1.1/String.html
# - http://www.ruby-doc.org/core-2.1.1/Symbol.html

def convert_string_to_symbol(a_string)
  a_string.to_sym
end

def convert_symbol_to_string(a_symbol)
  a_symbol.to_s
end

def me
  {
    name: "Boris",
    age: 26
  }
end

def fruits
  %w(apple banana orange)
end