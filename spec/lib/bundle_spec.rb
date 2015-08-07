require "spec_helper"
require '././lib/product'

describe Bundle do
	let(:size) {10}
	let(:price) {12.99}
	let(:count) {15}
	let(:bundle) {Bundle.new(size,price)}
	
	context "initialize" do
		it "accepts an initial size and price" do
			expect(bundle).to be_a(Bundle)
			expect(bundle.size).to eq(size)
			expect(bundle.price).to eq(price)
			expect(bundle.count).to eq(0)
		end
		it "accepts a count" do
			bundle.count = count
			expect(bundle.count).to eq(count)
		end
		it "fails without price and size arguments" do
			expect {Bundle.new()}.to raise_error(ArgumentError, /wrong number of arguments/)
		end
		it "fails when writing to size" do
			expect{bundle.size = 123}.to raise_error(NoMethodError,/undefined method/)
		end 
		it "fails when writing to price" do
			expect{bundle.price = 45.6}.to raise_error(NoMethodError,/undefined method/)
		end 

	end
	context "calculation" do
		it "calculates cost of price by count" do
			bundle.count = count
			expect(bundle.cost).to eq(194.85)
		end
		
		it "allows count of zero calculation" do
			expect(bundle.cost).to eq(0)
		end
	end 
end