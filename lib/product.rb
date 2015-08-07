

class Bundle
  attr_reader :size, :price
  attr_accessor :count
  
  def initialize(size, price)
    @size = size
    @price = price
    @count = 0
  end
  def cost
    return @count * @price
  end
end

class Product
  attr_accessor :qty, :bundles

  def initialize 
    @bundles = []
  end
  
  def total_cost
    @bundles.inject(0) {|total, bundle| bundle.cost + total}
  end
  
  def qty=(qty)
    @qty = qty.to_i
    remainder = self.after_allocate_primary_quantity
    allocate_remainder(remainder) unless remainder.nil?
  end
  
  protected
  
  def after_allocate_primary_quantity
    if not @bundles.empty?
      result = @qty.divmod(@bundles[0].size)
      @bundles[0].count = result[0]
      return result[1]
    end
  end
end

class ProductFactory

  def self.product(code)
    code.upcase!
    begin
      product = self.class.const_get("Product#{code}").new
    rescue NameError
      # when class for the code does not exist return a nil class
    end
    return product
  end
  
end
