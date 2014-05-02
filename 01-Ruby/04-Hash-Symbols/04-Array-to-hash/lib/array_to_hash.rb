def array_to_hash(array)
  hash = Hash.new
  array.each_with_index do |element, index|
    key = block_given? ? yield(index) : index
    hash[key] = element
  end
  hash
end