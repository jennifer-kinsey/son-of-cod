require 'rails_helper'

describe "the authorize and admin_authorize helper methods" do
  it "doesn't allow unsigned in users to leave a review" do
    product = FactoryGirl.create(:product)
    visit new_product_review_path(product)
    expect(page).to have_content "You aren't authorized to visit that page."
  end

  it "doesn't allow non-admins to create a new product" do
    visit new_product_path
    expect(page).to have_content "You aren't authorized to visit that page."
  end
end
