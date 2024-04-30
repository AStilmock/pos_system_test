require 'rails_helper'

RSpec.describe 'Website Login Page', type: :feature do
  describe 'login landing page' do
    before :each do
      @user = User.create!(username: "test", email: "fakeemail@email.com", password: "testpassword", permission: 0, discount_level: 0)
      visit login_index_path
    end
    
    it 'displays navbar' do
      expect(page).to have_link("Home")
      expect(page).to have_link("Shop")
      expect(page).to have_link("About")
      expect(page).to have_link("Login")
    end

    it 'displays login form' do
      expect(page).to have_field("username")
      expect(page).to have_field("password")
      expect(page).to have_field("confirm_password")
    end

    it 'displays create user link' do
      expect(page).to have_content("Don't have an account?")
      expect(page).to have_link("Create User")
    end

    it 'create user link' do
      click_link "Create User"
      expect(current_path).to eq new_login_path
    end

    it 'logs in user' do
      fill_in "username", with: @user.username
      fill_in "password", with: @user.password
      fill_in "confirm_password", with: @user.password
      click_button "Login"
      expect(current_path).to eq user_shopping_path
    end
  end
end