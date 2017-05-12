class CreateStoreNameAndBandNameAndPrice < ActiveRecord::Migration[5.1]
  def change
    create_table(:stores) do |s|
      s.column(:name, :string)

      s.timestamps
    end
    create_table(:brands) do |b|
      b.column(:name, :string)
      b.column(:price, :integer)

      b.timestamps
    end
  end
end
