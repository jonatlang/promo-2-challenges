class Customer
  attr_accessor :name, :address

  def initialize(name, address)
    @name = name
    @address = address
  end

  def to_s
    # Return a multiline string with name and address of customer
    <<EOS
    #{@name}
    #{@address[:address]}
    #{@address[:postal_code]} #{@address[:city]}
    Phone: #{@address[:phone]}
EOS
  end
end
