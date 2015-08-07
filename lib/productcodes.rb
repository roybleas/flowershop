require_relative("product")

class ProductR12 < Product 
  attr_reader :name, :code
  
  def initialize()
    @code = "R12"
    @name = "Roses"
    @bundles = [Bundle.new(10,12.99),Bundle.new(5,6.99)]
  end
  
  protected 
  
  def allocate_remainder(remainder)
    if remainder > @bundles[1].size
      @bundles[0].count += 1
    elsif remainder > 0
      @bundles[1].count = 1
    end
  end
end

class ProductL09 < Product 
  attr_reader :name, :code
  
  def initialize()
    @code = "L09"
    @name = "Lilies"
    @bundles = [Bundle.new(9,24.95), Bundle.new(6,16.95), Bundle.new(3,9.95)]
  end
  
  protected 
  
  def allocate_remainder(remainder)
    if remainder > @bundles[1].size
      @bundles[0].count += 1
    elsif remainder > @bundles[2].size
      @bundles[1].count = 1
    elsif remainder > 0
      @bundles[2].count = 1
    end
  end
end

class ProductT58 < Product 
  attr_reader :name, :code
  
  def initialize()
    @code = "T58"
    @name = "Tulips"
    @bundles = [Bundle.new(9,16.99), Bundle.new(5,9.95), Bundle.new(3,5.95)]
  end
  
  protected 
  
  def allocate_remainder(remainder)
    
    if @bundles[0].count == 0 
      allocate_minimum_remainder(remainder)
    else
      
      case remainder
      when 1
        @bundles[0].count -= 1
        @bundles[1].count = 2
      when 2
        @bundles[0].count -= 1
        @bundles[1].count = 1
        @bundles[2].count = 2
      when 3
        @bundles[2].count = 1
      when 4
        @bundles[0].count -= 1
        @bundles[1].count = 2
        @bundles[2].count = 1
      when 5
        @bundles[1].count = 1
      when 6
        @bundles[2].count = 2
      when 7
        @bundles[0].count -= 1
        @bundles[1].count = 2
        @bundles[2].count = 2
      when 8
        @bundles[1].count = 1
        @bundles[2].count = 1
      end 
    end
    
  end
  private 
  def allocate_minimum_remainder(remainder)
    case remainder
    when 1..3
      @bundles[2].count = 1
    when 4..5
      @bundles[1].count = 1
    when 6
      @bundles[2].count = 2
    when 7..8
      @bundles[1].count = 1
      @bundles[2].count = 1
    end
  end
  
end