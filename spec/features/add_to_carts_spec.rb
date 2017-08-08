require 'rails_helper'

RSpec.feature "adding items to cart increases cart size by adding that product", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

    1.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
        )
    end
  end
  scenario "user clicks on add button, cart size increases" do
    visit root_path
    expect(page).to have_css "article.product", count: 1

    click_on("Add")

    expect(page).to have_content 'My Cart (1)'
  end
end
