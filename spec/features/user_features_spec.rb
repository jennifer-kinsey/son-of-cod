require 'rails_helper'

describe "setting up a new user" do
  it "adds a new user" do
    visit '/signup'
    fill_in 'user_username', with: "Dev"
    fill_in "user_email", with: "dev@email.com"
    fill_in "user_password", with: "password"
    fill_in "user_password_confirmation", with: "password"
    click_button 'Sign Up'
    expect(page).to have_content "You've successfully signed up!"
  end

  it "returns error when there's a problem signing up" do
    visit '/signup'
    click_button 'Sign Up'
    expect(page).to have_content "There was a problem signing up"
  end

  it "returns error when there's a problem signing in" do
    visit '/signup'
    fill_in 'user_username', with: "Dev2"
    fill_in "user_email", with: "dev2@email.com"
    fill_in "user_password", with: "password"
    fill_in "user_password_confirmation", with: "password"
    click_button 'Sign Up'
    click_link 'Sign out'
    click_link 'Sign in'
    click_button 'Sign in'
    expect(page).to have_content "There was a problem signing in"
  end
end
