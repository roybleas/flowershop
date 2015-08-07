require "spec_helper"
require '././lib/product'

describe Product do
	context "calculate" do
		it "total cost is zero with empty bundles" do
			expect(Product.new.total_cost).to eq(0)
		end
		context "total cost" do
			let(:bundle1) {Bundle.new(5,6.99)}
			let(:product) {Product.new}
			
			before(:each) do
				bundle1.count = 1
				product.bundles << bundle1
			end
				
			it "of one bundle" do
				expect(product.total_cost).to eq(6.99)
			end 
			it "of multiple bundles" do
				bundle2 = Bundle.new(10,12.99)
				bundle2.count = 2
				product.bundles << bundle2
				expect(product.total_cost).to eq(32.97)
			end 
		end			
	end
end

describe ProductFactory do
	context "creates class for Product Code"
	it "R12" do
		expect(ProductFactory.product("R12")).to be_a(ProductR12)
	end
	
	it "L09" do
		expect(ProductFactory.product("L09")).to be_a(ProductL09)
	end
	
	it "T58 " do
		expect(ProductFactory.product("T58")).to be_a(ProductT58)
	end
	
	it "case insensitive" do
		expect(ProductFactory.product("r12")).to be_a(ProductR12)
	end
	
	context "unknown code" do
		it "returns nil" do	
			expect(ProductFactory.product("Q12")).to be_nil	
		end
	end
	
end