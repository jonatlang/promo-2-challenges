# This is how you define your own custom exception classes
class DepositError < StandardError
end

class BankAccount

  attr_reader :name, :position

  # Contract for the BankAccount class
  # - you can access full owner's name and position, but partial IBAN
  # - you cannot access full IBAN
  # - you can print partial account infos
  # - you can print transactions only with a password
  # - you can withdraw or deposit money
  # - You can see the balance of the account (through the position variable)

  MIN_DEPOSIT =  100

  def initialize(name, iban, initial_deposit, password)
    raise DepositError, "Insufficient deposit" unless initial_deposit > MIN_DEPOSIT
    @password = password
    @transactions = []
    @position = 0
    @name, @iban = name, iban

    add_transaction(initial_deposit)
  end

  def withdraw(amount)
    add_transaction(-amount)
    "You have withdrawn #{amount} euros"
  end

  def deposit(amount)
    add_transaction(amount)
    "You have made a deposit of #{amount} euros"
  end

  def transactions_history(args = {})
    # Should return a string displaying the transactions, BUT NOT return the transaction array !
    password = args[:password]
    if password.nil?
      "no password given"
    elsif password != @password
      "wrong password"
    else
      @transactions.join(',')
    end
  end

  def iban
    # Partial getter (should hide the middle of the IBAN like FR14**************606)
    iban = @iban.split('-')

    "#{iban.first}#{'*' * 14}#{iban.last}"
  end

  def to_s
    # Method used when printing account object as string (also used for string interpolation)
    "Owner: #{name}\nIBAN: #{iban}\n Current amount: #{position} euros"
  end

  private

  def add_transaction(amount)
    @transactions << amount
    @position += amount
  end

end
