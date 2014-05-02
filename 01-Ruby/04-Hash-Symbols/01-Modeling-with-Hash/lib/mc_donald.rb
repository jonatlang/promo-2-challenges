DISHES = {
  "Cheese Burger" => 290,
  "Big Mac" => 300,
  "Mc Bacon" => 400,
  "Royal Cheese" => 130,
  "French fries" => 130,
  "Potatoes" => 130,
  "Coca" => 160,
  "Sprite" => 170
}

MENUS = {
  "Happy Meal"=> ["Cheese Burger", "French fries", "Coca"],
  "Best Of Big Mac" => ["Big Mac", "French fries", "Coca"],
  "Best Of Royal Cheese" => ["Royal Cheese", "Potatoes", "Sprite"]
}

def poor_calories_counter(burger, side, beverage)
  DISHES[burger] + DISHES[side] + DISHES[beverage]
end

def calories_counter(*orders)
  orders.reduce(0) do |calories, order|
    if DISHES[order]  # The order is a simple dish
      calories += DISHES[order]
    else              # The order is a full menu
      calories += DISHES.values_at(*MENUS[order]).reduce(:+)
    end
  end
end
