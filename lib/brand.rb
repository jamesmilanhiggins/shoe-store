class Brand < ActiveRecord::Base
  has_and_belongs_to_many(:stores)
  validates(:name, presence: true, uniqueness: true, length: { maximum: 100})
  validates(:price, numericality: true , presence: true)

  before_save(:capitalize_name)


  def change_price_to_currency(price)
   sprintf('%.2f', price)
  end

  def capitalize_name
    self.name.capitalize!
  end
end
