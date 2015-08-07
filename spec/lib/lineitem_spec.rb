require "spec_helper"
require '././lib/orders'

describe Lineitem do
	context "initialize" do
		it "accepts an order line" do
			expect(Lineitem.new("a")).to be_a(Lineitem)
		end
		it "fails without orderline" do
			expect {Lineitem.new()}.to raise_error(ArgumentError, /wrong number of arguments/)
		end
	end
	
	context "invalid order line" do
		it "does not have a quantity" do 
			li = Lineitem.new("A12")
			expect(li.valid?).to be_falsey
		end
		it "does not have a code" do
			li = Lineitem.new("123")
			expect(li.valid?).to be_falsey
		end
		it "has nil quantity" do
			li = Lineitem.new("X")
			expect(li.qty).to be_nil
		end
		it "has a nil code" do
			li = Lineitem.new("X")
			expect(li.code).to be_nil
		end
	end
	
	context "valid order line" do
		let(:lineitem) {Lineitem.new("12 B34")}
		it "has a numeric quantity and product code" do
			expect(lineitem.valid?).to be_truthy
		end
		it "has a product code" do
			expect(lineitem.code).to eq("B34")
		end	
		it "has a quantity" do
				expect(lineitem.qty).to eq(12)
		end
		it "has a lowercase code letter" do
			case_lineitem = Lineitem.new("5 c67")
			expect(case_lineitem.valid?).to be_truthy
			expect(case_lineitem.code).to eq("C67")
		end
	end
end