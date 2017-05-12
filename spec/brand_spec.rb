require "spec_helper"

describe(Brand) do
  it { should have_and_belong_to_many(:stores) }
  it ("validates presence of a name") do
    brand = Brand.new({name: "" })
    expect(brand.save).to eq false
  end
  # it ("capitalizes the first letter of the brand name") do
  #   brand = Brand.create({name: "nike"})
  #   expect(brand.name).to eq "Nike"
  # end
  it ("validates the length of the brand name") do
    brand = Brand.create({name: "J" * 200})
    expect(brand.save).to eq false
  end
  it ("validates the uniqueness of the name") do
    brand = Brand.create({name: "nike"})
    brand2 = Brand.create({name: "nike"})
    expect(brand2.save).to eq false
  end



  # describe "#change_price_to_currency" do
  #   it ("changes number of a price to a currency") do
  #     brand = Brand.create({name: "james", price: 10.45 })
  #     expect(brand.change_price_to_currency(brand.price)).to eq "$10.45"
  #   end
  # end
end
