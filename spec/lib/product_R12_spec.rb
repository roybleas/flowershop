require "spec_helper"
require '././lib/productcodes'

describe ProductR12 do
	context "has initially" do
		
		it "2 bundle types" do
			expect(subject.bundles[0].size).to eq(10)
			expect(subject.bundles[0].price).to eq(12.99)
			expect(subject.bundles[1].size).to eq(5)
			expect(subject.bundles[1].price).to eq(6.99)
		end
		it "the name Roses" do
			expect(subject.name).to eq("Roses")
		end
		it "the code R12" do
			expect(subject.code).to eq("R12")
		end
	end
	
	context "allocate bundles per quantity" do
		let(:product) {ProductR12.new}
		let(:primary_bundle) {product.bundles[0]}
		let(:remainder_bundle) {product.bundles[1]}
		
		it "of zero" do
			product.qty = 0
			expect(primary_bundle.count).to eq(0)
			expect(remainder_bundle.count).to eq(0)
		end	
		it "of 1" do
			product.qty = 1
			expect(primary_bundle.count).to eq(0)
			expect(remainder_bundle.count).to eq(1)
		end
		it "of <= 5" do
			product.qty = 5
			expect(primary_bundle.count).to eq(0)
			expect(remainder_bundle.count).to eq(1)
		end
		it "of > 5 and <= 10" do
			product.qty = 6
			expect(primary_bundle.count).to eq(1)
			expect(remainder_bundle.count).to eq(0)
			product.qty = 10
			expect(primary_bundle.count).to eq(1)
			expect(remainder_bundle.count).to eq(0)
		end
		it "of > 10 and <= 15" do
			product.qty = 11
			expect(primary_bundle.count).to eq(1)
			expect(remainder_bundle.count).to eq(1)
			product.qty = 15
			expect(primary_bundle.count).to eq(1)
			expect(remainder_bundle.count).to eq(1)
		end
		it "of > 15 and <= 20" do
			product.qty = 16
			expect(primary_bundle.count).to eq(2)
			expect(remainder_bundle.count).to eq(0)
			product.qty = 20
			expect(primary_bundle.count).to eq(2)
			expect(remainder_bundle.count).to eq(0)
		end

	end
	

end