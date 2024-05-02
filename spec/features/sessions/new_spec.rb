require 'rails_helper'

RSpec.describe 'User Login Feature', type: :feature do
  describe 'user can create new session' do
    before :each do
      @user = User.create!(username: "test", email: "testemail@email.com", password_digest: "testpassword1!", crypted_password: "testpassword1!")
      visit login_path
    end

    it 'displays nav bar' do
      expect(page).to have_link("Home")
      expect(page).to have_link("Register")
      expect(page).to have_link("Login")
    end

    it 'displays login form' do
      expect(page).to have_field("email")
      expect(page).to have_field("password_digest")
    end

    it 'user logs in' do
      fill_in "email", with: @user.email
      fill_in "password_digest", with: @user.password
      click_button "Login"
      expect(current_path).to eq root_path
      expect(page).to have_content("Login Successful")
      expect(@_current_user).to eq(@user)
    end
  end
end