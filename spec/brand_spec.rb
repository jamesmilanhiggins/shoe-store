require "spec_helper"

describe(Brand) do
  it { should have_and_belong_to_many(:stores) }
  # it { should validate_numericality_of(:rating) }
end
