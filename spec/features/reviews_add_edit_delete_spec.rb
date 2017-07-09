require 'rails_helper'

describe "add review path" do
  it "adds a new review" do
    user = FactoryGirl.create(:user)
    product = FactoryGirl.create(:product)
    visit '/signin'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'
    visit product_path(product)
    click_link 'Add new review'
    fill_in 'Comment', with: 'Amazing fish'
    fill_in 'Rating', with: 5
    click_on 'Create Review'
    expect(page).to have_content 'Amazing fish'
  end

  it "returns error when field is left blank on the review on add" do
    user = FactoryGirl.create(:user)
    product = FactoryGirl.create(:product)
    visit '/signin'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'
    visit product_path(product)
    click_link 'Add new review'
    fill_in 'Comment', with: ''
    fill_in 'Rating', with: 5
    click_on 'Create Review'
    expect(page).to have_content 'errors'
  end

  it "allows user to edit their own review" do
    user = FactoryGirl.create(:user)
    product = FactoryGirl.create(:product)
    visit '/signin'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'
    visit product_path(product)
    click_link 'Add new review'
    fill_in 'Comment', with: 'Amazing fish'
    fill_in 'Rating', with: 5
    click_on 'Create Review'
    click_on 'Edit Review'
    fill_in 'Rating', with: 1
    click_button 'Update Review'
    expect(page).to have_content 'Review successfully updated!'
  end

  it "doesn't allow incomplete edits of their own review" do
    user = FactoryGirl.create(:user)
    product = FactoryGirl.create(:product)
    visit '/signin'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'
    visit product_path(product)
    click_link 'Add new review'
    fill_in 'Comment', with: 'Amazing fish'
    fill_in 'Rating', with: 5
    click_on 'Create Review'
    click_on 'Edit Review'
    fill_in 'Comment', with: ""
    click_button 'Update Review'
    expect(page).to have_content 'errors'
  end

  #Admins can delete reviews
  it "allows user to edit their own review" do
    user = FactoryGirl.create(:user)
    product = FactoryGirl.create(:product)
    admin = FactoryGirl.create(:admin)

    #user signs in and leaves a review
    visit '/signin'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'
    visit product_path(product)
    click_link 'Add new review'
    fill_in 'Comment', with: 'Amazing fish'
    fill_in 'Rating', with: 5
    click_on 'Create Review'
    click_link 'Sign out'

    #admin logs in and is able to delete review
    visit '/signin'
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Sign in'
    visit product_path(product)
    click_link 'Delete Review'
    expect(page).to have_content 'Review successfully destroyed!'
  end
end
