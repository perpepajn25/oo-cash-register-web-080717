require 'pry'

class CashRegister
  attr_accessor :total , :discount, :items, :last_transaction

  def initialize(employee_discount = nil)
    @total = 0
    @discount = employee_discount
    @items= []
  end

  def add_item(title,price,quantity=1)
    @total += price*quantity
    @items << ("#{title} "*quantity).split
    @last_transaction = price*quantity
  end

  def apply_discount
    if @discount != nil
      @total -= @discount*10
      "After the discount, the total comes to $#{@total}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items.flatten
  end

  def void_last_transaction
    @total -= @last_transaction
  end

end
