require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'is valid with valid attributes' do
      @category = Category.new(name: "category-name")
      @product = @category.products.new(name: "product-name",
                                        price: 500,
                                        quantity: 7
                                        )
      expect(@product).to be_valid
    end
    it 'is not valid without a name' do
      @category = Category.new(name: "category-name")
      @product = @category.products.new(name: nil,
                                        price: 500,
                                        quantity: 7
                                        )
      expect(@product).to_not be_valid
      expect{ raise StandardError, "can't be blank"}.to raise_error("can't be blank")
    end
    it 'is not valid without a price' do
      @category = Category.new(name: "category-name")
      @product = @category.products.new(name: "product-name",
                                        price: nil,
                                        quantity: 7
                                        )
      expect(@product).to_not be_valid
      expect{ raise StandardError, "can't be blank"}.to raise_error("can't be blank")
    end
    it 'is not valid without a quantity' do
      @category = Category.new(name: "category-name")
      @product = @category.products.new(name: "product-name",
                                        price: 500,
                                        quantity: nil
                                        )
      expect(@product).to_not be_valid
      expect{ raise StandardError, "can't be blank"}.to raise_error("can't be blank")
    end
    it 'is not valid without a category' do
      @product = Product.new(name: "product-name",
                                        price: 500,
                                        quantity: 7
                                        )
      expect(@product).to_not be_valid
      expect{ raise StandardError, "can't be blank"}.to raise_error("can't be blank")
    end
  end
end
