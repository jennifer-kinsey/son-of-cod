require 'rails_helper'

#admins only
describe "adding and removing product path" do
  it "adds a new product" do
    admin = FactoryGirl.create(:admin)
    visit /signin
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_on 'Sign in'
    visit new_product_path
    product = FactoryGirl.create(:product)
    fill_in 'Name', with: product.name
    fill_in 'Price', with: product.price
    fill_in 'Origin', with: procuct.origin
    fill_in 'Date caught', with: product.date_caught
    fill_in 'Description', with: product.description
    fill_in 'Image', with: product.image
    click_on 'Create Product'
    expect(page).to have_content 'Product has been added'
    expect(page).to have_content product.name
  end

  it "returns error when field is left blank when adding a new product" do
    admin = FactoryGirl.create(:admin)
    visit /signin
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_on 'Sign in'
    visit new_product_path
    click_on 'Create Product'
    expect(page).to have_content 'errors'
  end
end
