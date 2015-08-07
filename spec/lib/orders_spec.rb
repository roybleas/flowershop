require "spec_helper"
require '././lib/orders'

describe Orders do
	context "read " do
		let(:orderlist) {[]}
		it "output a message for invalid order item" do	
			orderlist << "not an orderitems"
			expect{subject.read_order(orderlist)}.to output("Invalid order item: #{orderlist[0]}\n").to_stdout 
		end
		
		it "process a valid order item "	do 			
			orderlist << "10 R12\n"
			expect{subject.read_order(orderlist)}.to output(/10 R12 \$12.99/).to_stdout 
		end
		
		it "outputs an error message when invalid code" do
			productcode = "X12"
			orderlist << "12 #{productcode}"
			expect{subject.read_order(orderlist)}.to output("Invalid order item: Unknown product code: #{productcode}").to_stdout 
		end
	end
	context "print" do
		context "single order item" do
			let(:orderline) {["20 R12"]}
			it " prints a header" do
				expect{subject.read_order(orderline)}.to output(/20 R12 \$25.98/).to_stdout 
			end
			it " prints a row" do
				expect{subject.read_order(orderline)}.to output(/2 x 10 \$12.99/).to_stdout 
			end
			it "with multiple rows" do
				orderline = ["15 L09"]
				expect{subject.read_order(orderline)}.to output(" 15 L09 $41.90\n      1 x  9 $24.95\n      1 x  6 $16.95\n\n").to_stdout 
			end
		end
		context "multiple order items" do
			let(:orderlist) {["30 R12","13 T58"]}
			it " prints headers" do
				expect{subject.read_order(orderlist)}.to output(/30 R12 \$38.97/).to_stdout 
				expect{subject.read_order(orderlist)}.to output(/13 T58 \$25.85/).to_stdout 
			end
			it " prints row from each order item" do
				expect{subject.read_order(orderlist)}.to output(/3 x 10 \$12.99/).to_stdout 
				expect{subject.read_order(orderlist)}.to output(/2 x  5 \$9.95/).to_stdout 
				expect{subject.read_order(orderlist)}.to output(/1 x  3 \$5.95/).to_stdout 
			end
		end
	end
end