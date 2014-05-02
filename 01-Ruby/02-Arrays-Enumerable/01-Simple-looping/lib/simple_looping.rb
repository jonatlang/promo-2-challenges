require relative "def"

puts"quel est votre date de naissance?"
year = get.chomps.to_i
puts"quel est votre moi de naissance?"
month = get.chomps.to_i
puts "quel est votre jour de naissance?"
day = get.chomps.to_i

calculated age = age_in_days(year, month, day)
