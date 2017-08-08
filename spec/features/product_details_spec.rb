require 'rails_helper'

RSpec.feature "users can navigate from home to productdetail by clicking on product", type: :feature, js: true do
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
  scenario "they see all products on homepage and click the details button" do
    visit root_path

    expect(page).to have_css "article.product", count: 1
    click_on("Details")

    expect(page).to have_css "article.product-detail"
  end
  scenario "they see all products on homepage and click the product header" do
    visit root_path

    expect(page).to have_css "article.product", count: 1
    within("header.product-detail-link") do
      find(".product-link").click
    end
    expect(page).to have_css "article.product-detail"
  end
end
