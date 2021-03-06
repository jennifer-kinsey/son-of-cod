require 'rails_helper'

#admins only
describe "adding, editing, and removing product path" do
  it "adds a new product" do
    admin = FactoryGirl.create(:admin)
    visit '/signin'
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Sign in'
    visit new_product_path
    fill_in 'Name', with: "fish"
    fill_in 'Price', with: "10"
    fill_in 'Origin', with: "Idaho"
    fill_in 'Date caught', with: "05/05/2017"
    fill_in 'Description', with: "fishy"
    fill_in 'Image', with: "img.jpg"
    click_on 'Create Product'
    expect(page).to have_content 'Product successfully added!'
    expect(page).to have_content 'fish'
  end

  it "returns error when field is left blank when adding a new product" do
    visit '/signin'
    admin = FactoryGirl.create(:admin)

    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Sign in'
    visit new_product_path
    click_on 'Create Product'
    #####partial error form is NOT rendering. ???
    expect(page).to have_content 'Oops. Try again. You missed something.'
  end

  it "edits an existing product" do
    admin = FactoryGirl.create(:admin)
    visit '/signin'
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Sign in'
    product = FactoryGirl.create(:product)
    visit product_path(product)
    click_on 'Edit Product'
    fill_in 'Name', with: "Moonfish"
    click_on 'Update Product'
    expect(page).to have_content 'Product successfully updated'
    expect(page).to have_content 'Moonfish'
  end

  it "handles bad edits of an existing product" do
    admin = FactoryGirl.create(:admin)
    visit '/signin'
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Sign in'
    product = FactoryGirl.create(:product)
    visit product_path(product)
    click_on 'Edit Product'
    fill_in 'Name', with: ""
    click_on 'Update Product'
    expect(page).to have_content 'Oops. Try again. You missed something.'
  end

  it "deletes a product" do
    admin = FactoryGirl.create(:admin)
    visit '/signin'
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Sign in'
    product = FactoryGirl.create(:product)
    visit product_path(product)
    click_on 'Delete Product'
    expect(page).to have_content 'Your product has been deleted'
    expect(page).to have_no_content product.name
  end
end
