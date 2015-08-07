require "spec_helper"
require '././lib/productcodes'

describe ProductT58 do
	context "has initially" do
		
		it "3 bundle types" do
			expect(subject.bundles[0].size).to eq(9)
			expect(subject.bundles[0].price).to eq(16.99)
			expect(subject.bundles[1].size).to eq(5)
			expect(subject.bundles[1].price).to eq(9.95)
			expect(subject.bundles[2].size).to eq(3)
			expect(subject.bundles[2].price).to eq(5.95)
		end
		it "the name Tulips" do
			expect(subject.name).to eq("Tulips")
		end
		it "the code L09" do
			expect(subject.code).to eq("T58")
		end
	end
	context "allocate bundles per quantity" do
		let(:product) {subject}
		let(:primary_bundle) {product.bundles[0]}
		let(:remainder_bundle5) {product.bundles[1]}
		let(:remainder_bundle3) {product.bundles[2]}
		
		it "of zero" do
			product.qty = 0
			expect(primary_bundle.count).to eq(0)
			expect(remainder_bundle5.count).to eq(0)
			expect(remainder_bundle3.count).to eq(0)
		end	
		it "of 1" do
			product.qty = 1
			expect(primary_bundle.count).to eq(0)
			expect(remainder_bundle5.count).to eq(0)
			expect(remainder_bundle3.count).to eq(1)
		end
		it "of <= 3" do
			product.qty = 3
			expect(primary_bundle.count).to eq(0)
			expect(remainder_bundle5.count).to eq(0)
			expect(remainder_bundle3.count).to eq(1)
		end
		it "of > 3 and <= 5" do
			product.qty = 4
			expect(primary_bundle.count).to eq(0)
			expect(remainder_bundle5.count).to eq(1)
			expect(remainder_bundle3.count).to eq(0)
			product.qty = 5
			expect(primary_bundle.count).to eq(0)
			expect(remainder_bundle5.count).to eq(1)
			expect(remainder_bundle3.count).to eq(0)
		end
		it "of 6 " do
			product.qty = 6
			expect(primary_bundle.count).to eq(0)
			expect(remainder_bundle5.count).to eq(0)
			expect(remainder_bundle3.count).to eq(2)
		end
		it "of > 6 and <=8" do
			product.qty = 7
			expect(primary_bundle.count).to eq(0)
			expect(remainder_bundle5.count).to eq(1)
			expect(remainder_bundle3.count).to eq(1)
			product.qty = 8
			expect(primary_bundle.count).to eq(0)
			expect(remainder_bundle5.count).to eq(1)
			expect(remainder_bundle3.count).to eq(1)
		end
		it "of 9" do
			product.qty = 9
			expect(primary_bundle.count).to eq(1)
			expect(remainder_bundle5.count).to eq(0)
			expect(remainder_bundle3.count).to eq(0)
		end
		it "of 10" do
			product.qty = 10
			expect(primary_bundle.count).to eq(0)
			expect(remainder_bundle5.count).to eq(2)
			expect(remainder_bundle3.count).to eq(0)
		end
		it "of 11" do
			product.qty = 11
			expect(primary_bundle.count).to eq(0)
			expect(remainder_bundle5.count).to eq(1)
			expect(remainder_bundle3.count).to eq(2)
		end	
		it "of 12 " do		
			product.qty = 12
			expect(primary_bundle.count).to eq(1)
			expect(remainder_bundle5.count).to eq(0)
			expect(remainder_bundle3.count).to eq(1)
		end
		it "of 13" do
			product.qty = 13
			expect(primary_bundle.count).to eq(0)
			expect(remainder_bundle5.count).to eq(2)
			expect(remainder_bundle3.count).to eq(1)
		end
		it "of 14" do
			product.qty = 14
			expect(primary_bundle.count).to eq(1)
			expect(remainder_bundle5.count).to eq(1)
			expect(remainder_bundle3.count).to eq(0)
		end
		it "of 15" do
			product.qty = 15
			expect(primary_bundle.count).to eq(1)
			expect(remainder_bundle5.count).to eq(0)
			expect(remainder_bundle3.count).to eq(2)
		end
		it "of 16" do
			product.qty = 16
			expect(primary_bundle.count).to eq(0)
			expect(remainder_bundle5.count).to eq(2)
			expect(remainder_bundle3.count).to eq(2)
		end			
		it "of 17" do
			product.qty = 17
			expect(primary_bundle.count).to eq(1)
			expect(remainder_bundle5.count).to eq(1)
			expect(remainder_bundle3.count).to eq(1)
		end
		it "of 18" do
			product.qty = 18
			expect(primary_bundle.count).to eq(2)
			expect(remainder_bundle5.count).to eq(0)
			expect(remainder_bundle3.count).to eq(0)
		end
		it "of 19" do
			product.qty = 19
			expect(primary_bundle.count).to eq(1)
			expect(remainder_bundle5.count).to eq(2)
			expect(remainder_bundle3.count).to eq(0)
		end
		it "of 20" do
			product.qty = 20
			expect(primary_bundle.count).to eq(1)
			expect(remainder_bundle5.count).to eq(1)
			expect(remainder_bundle3.count).to eq(2)
		end
		it "of 21" do
			product.qty = 21
			expect(primary_bundle.count).to eq(2)
			expect(remainder_bundle5.count).to eq(0)
			expect(remainder_bundle3.count).to eq(1)
		end
	end
end