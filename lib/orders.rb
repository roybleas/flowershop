# Orders 
# Used to process the orders request
require_relative( 'product')

class Orders 
	
	def read_order(orderlist)
		orderlist.each do |orderline|
			lineitem = Lineitem.new(orderline)
			if lineitem.valid?
				productitem = product(lineitem.code)
				if not productitem.nil?
					productitem.qty = lineitem.qty
					print_order_item(productitem)
				end
			else
				printf "Invalid order item: %s",orderline
			end
		end
	end
	
	def product(productcode)
		productitem = ProductFactory.new(productcode)
		if productitem.nil?
			printf "Invalid order item: Unknown product code: %s",productcode 
		end
		return productitem
	end
	
	def print_order_item(productitem)
		printf "%3d %s $%.2f",productitem.qty, productitem.code, productitem.totalcost
		productitem.bundles.each do |bundle| 
			printf "\t%3d x %2d $%.2f", bundle.count, bundle.size, bundle.price unless bundle.count == 0
		end
	end
	
end

# Lineitem 
# Parse and validate orderline 
class Lineitem
	attr_accessor :qty, :code
	
	def initialize(orderline) 
		@orderline = orderline.upcase  
		if self.valid?
			order = @orderline.split  
			@qty = order[0].to_i
			@code = order[1]
		end
	end
	
	def valid?
		!(@orderline =~ /^\d+\s+[A-Z]\d{2}$/).nil?
	end
	
end