require 'pry'

class CashRegister
  attr_accessor :total, :discount, :items, :last_transaction_price

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
  end

  def total
    @total
  end

  def add_item(title, price, quantity=1)
    self.total += (price * quantity)
    quantity > 1 ? quantity.times { self.items << title } : self.items << title
    self.last_transaction_price = price
  end

  def apply_discount
    if discount > 0
      self.total = (((100 - @discount)/100.to_f) * @total).to_i
      "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    self.total -= last_transaction_price
  end
end
