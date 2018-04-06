class CashRegister
  attr_accessor :total, :discount, :items, :last_transaction

  def initialize(discount = nil)
    @total = 0
    @discount = discount
    @items = []
  end

  def total
    @total
  end

  def add_item(title, price, quantity = nil)
    if quantity == nil
      @total += price
      @items << title
    else
      @total += price * quantity
      quantity.times do @items << title end
    end
    @last_transaction = price
  end

  def apply_discount
    if @discount == nil
      "There is no discount to apply."
    else
      @total = (@total * (1 - discount * 0.01)).to_i
      "After the discount, the total comes to $#{@total}."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total -= @last_transaction
  end
end
