require 'rails_helper'

RSpec.describe 'Website New Login Page', type: :feature do
  describe 'create new user page' do
    before :each do
      visit new_login_path
    end

    it 'displays navbar' do
      expect(page).to have_link("Home")
      expect(page).to have_link("Shop")
      expect(page).to have_link("About")
      expect(page).to have_link("Login")
    end

    it 'displays create user form' do
      expect(page).to have_field("username")
      expect(page).to have_field("email")
      expect(page).to have_field("password")
      expect(page).to have_field("confirm_password")
      expect(page).to have_content("Password must be at least 8 characters long and contain at least one number and one character.")
    end

    it 'creates new user' do
      fill_in "username", with: "test"
      fill_in "email", with: "fakeemail@email.com"
      fill_in "password", with: "fakepassword1!"
      fill_in "confirm_password", with: "fakepassword1!"
      click_button "Create User"
      expect(current_path).to eq user_shopping_index_path
    end
  end
end