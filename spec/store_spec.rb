require "spec_helper"

describe(Store) do
  it { should have_and_belong_to_many(:brands) }

  it ("validates presence of a name") do
    store = Store.new({name: "" })
    expect(store.save).to eq false
  end
  it ("capitalizes the first letter of the store name") do
    store = Store.create({name: "james"})
    expect(store.name).to eq "James"
  end

  it ("validates the length of the store name") do
    store = Store.create({name: "J" * 200})
    expect(store.save).to eq false
  end
  it ("validates the uniqueness of the name") do
    store = Store.create({name: "james"})
    store2 = Store.create({name: "james"})
    expect(store2.save).to eq false
  end
end
