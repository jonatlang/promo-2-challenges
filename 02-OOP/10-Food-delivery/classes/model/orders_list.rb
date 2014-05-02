class OrdersList
  def initialize
    # We'll hold orders in a hash where keys will be the delivery guys ID's
    # The block given to Hash.new will make sure we have a new empty array for
    # any key called on the hash that doesn't exist yet
    @orders_list = Hash.new { |hsh, key| hsh[key] = [] }
  end

  # Add an order to the orders list
  def add(order)
    @orders_list[order.delivery_guy.object_id] << order
  end

  # Return all orders sorted by order number
  def all
    @orders_list.values.flatten.sort_by { |order| order.num }
  end

  # Return all orders assigned to a given delivery guy
  def for_delivery_guy(delivery_guy)
    @orders_list[delivery_guy.object_id]
  end

  # Remove order
  def remove(order)
    @orders_list[order.delivery_guy.object_id].delete(order)
  end

end
