class Brand < ActiveRecord::Base
  has_and_belongs_to_many(:stores)
  validates(:name, presence: true, uniqueness: true, length: { maximum: 100})
  # validates(:price, :numericality => true, :format => { :with => ^\$?[0-9]{1,3}(?:,?[0-9]{3})*(?:\.[0-9]{2})?$ })

  before_save(:capitalize_name)
  # before_save(:change_price_to_currency)


  private

    def capitalize_name
      self.name.capitalize!
    end
    # def change_price_to_currency
    #   # price = self.number_to_currency(price)
    #   price = price.to_s
    #   self.number_to_currency.price!
    # end
end
