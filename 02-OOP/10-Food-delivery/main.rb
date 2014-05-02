# encoding: UTF-8

require_relative 'classes/ui/ui'
require_relative 'classes/model/restaurant'

require_relative 'classes/model/employees/delivery_guy'
require_relative 'classes/model/employees/manager'

##### SET UP OUR RESTAURANT #####
wagon_bar = Restaurant.new('Le Wagon Bar')

# Add items to the inventory of the restaurant
items = [
    { name: 'Happy Papillard', price: 10.5 },
    { name: 'Olive&tomates', price: 10.5 },
    { name: 'Mack & cheese', price: 10.5 },
    { name: 'Romano fresh!', price: 10.5 },
    { name: 'Estellartois', price: 6 },
    { name: 'Nielchips', price: 4.5 },
    { name: 'Croq\' Mathieu', price: 8 },
    { name: 'Sébaspain', price: 5 },
    { name: 'Christillant de poulet', price: 9 },
    { name: 'Célatine', price: 5 },
    { name: 'Xu-in-gum', price: 3 },
    { name: 'Mentaleau', price: 4 }
# out of inspiration..... :)
]

items.each do |item|
  wagon_bar.add_meal(item[:name], item[:price])
end

# Add employees (name & password)
puts 'Available employees and their password to try the program out:'
boris = Manager.new('Boris', 'papillard')
wagon_bar.add_employee(boris)
puts 'Boris:papillard => Manager'

olivier = Manager.new('Olivier', 'olance')
wagon_bar.add_employee(olivier)
puts 'Olivier:olance => Manager'

fred = DeliveryGuy.new('Frédéric', 'forlicki')
wagon_bar.add_employee(fred)
puts 'Frédéric:forlicki => Delivery guy'

edouard = DeliveryGuy.new('Edouard', 'erudolf')
wagon_bar.add_employee(edouard)
puts 'Edouard:erudolf => Delivery guy'
################################

puts "\n\n"

# Start the UI for our brand new restaurant!
RestaurantUI.start_ui(wagon_bar)




