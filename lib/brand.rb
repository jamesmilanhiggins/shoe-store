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

  # before_save(:change_price_to_currency)

# def change_price_to_currency
#   self.price.number_to_currency
# end
# def number_to_currency
#

# validates(:price, :numericality => true, :format => { :with => ^\$?[0-9]{1,3}(?:,?[0-9]{3})*(?:\.[0-9]{2})?$ })
# end
  # def change_price_to_currency(price)
  #   sprintf('%.2f', price)
  # end
  #
  # private

  # define_method(:monify) do
  #   self.price = self.price.to_f.round(2)
  # end
