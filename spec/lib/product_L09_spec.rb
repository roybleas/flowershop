require "spec_helper"
require '././lib/productcodes'

describe ProductL09 do
	context "has initially" do
		
		it "3 bundle types" do
			expect(subject.bundles[0].size).to eq(9)
			expect(subject.bundles[0].price).to eq(24.95)
			expect(subject.bundles[1].size).to eq(6)
			expect(subject.bundles[1].price).to eq(16.95)
			expect(subject.bundles[2].size).to eq(3)
			expect(subject.bundles[2].price).to eq(9.95)
		end
		it "the name Lilies" do
			expect(subject.name).to eq("Lilies")
		end
		it "the code L09" do
			expect(subject.code).to eq("L09")
		end
	end
	context "allocate bundles per quantity" do
		let(:product) {subject}
		let(:primary_bundle) {product.bundles[0]}
		let(:remainder_bundle6) {product.bundles[1]}
		let(:remainder_bundle3) {product.bundles[2]}
		
		it "of zero" do
			product.qty = 0
			expect(primary_bundle.count).to eq(0)
			expect(remainder_bundle6.count).to eq(0)
			expect(remainder_bundle3.count).to eq(0)
		end	
		it "of 1" do
			product.qty = 1
			expect(primary_bundle.count).to eq(0)
			expect(remainder_bundle6.count).to eq(0)
			expect(remainder_bundle3.count).to eq(1)
		end
		it "of <= 3" do
			product.qty = 3
			expect(primary_bundle.count).to eq(0)
			expect(remainder_bundle6.count).to eq(0)
			expect(remainder_bundle3.count).to eq(1)
		end
		it "of > 3 and <= 6" do
			product.qty = 4
			expect(primary_bundle.count).to eq(0)
			expect(remainder_bundle6.count).to eq(1)
			expect(remainder_bundle3.count).to eq(0)
			product.qty = 6
			expect(primary_bundle.count).to eq(0)
			expect(remainder_bundle6.count).to eq(1)
			expect(remainder_bundle3.count).to eq(0)
		end
		it "of > 6 and <= 9" do
			product.qty = 7
			expect(primary_bundle.count).to eq(1)
			expect(remainder_bundle6.count).to eq(0)
			expect(remainder_bundle3.count).to eq(0)
			product.qty = 9
			expect(primary_bundle.count).to eq(1)
			expect(remainder_bundle6.count).to eq(0)
			expect(remainder_bundle3.count).to eq(0)
		end
		it "of > 9 and <= 12" do
			product.qty = 10
			expect(primary_bundle.count).to eq(1)
			expect(remainder_bundle6.count).to eq(0)
			expect(remainder_bundle3.count).to eq(1)
			product.qty = 12
			expect(primary_bundle.count).to eq(1)
			expect(remainder_bundle6.count).to eq(0)
			expect(remainder_bundle3.count).to eq(1)
		end
		it "of > 12 and <= 15" do
			product.qty = 13
			expect(primary_bundle.count).to eq(1)
			expect(remainder_bundle6.count).to eq(1)
			expect(remainder_bundle3.count).to eq(0)
			product.qty = 15
			expect(primary_bundle.count).to eq(1)
			expect(remainder_bundle6.count).to eq(1)
			expect(remainder_bundle3.count).to eq(0)
		end
		it "of > 15 and <= 18" do
			product.qty = 16
			expect(primary_bundle.count).to eq(2)
			expect(remainder_bundle6.count).to eq(0)
			expect(remainder_bundle3.count).to eq(0)
			product.qty = 18
			expect(primary_bundle.count).to eq(2)
			expect(remainder_bundle6.count).to eq(0)
			expect(remainder_bundle3.count).to eq(0)
		end
	end
end