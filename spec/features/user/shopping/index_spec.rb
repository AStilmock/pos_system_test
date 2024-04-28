require 'rails_helper'

RSpec.describe 'User Shopping Index Page', type: :feature do
  describe 'user/shopping index page' do 
    before :each do
      @user = User.create!(username: "test", email: "fakeemail@email.com", password: "test", permission: 0, discount_level: 0)
      visit user_shopping_index_path
    end

    it 'displays navbar' do
      expect(page).to have_link("Home")
      expect(page).to have_link("Shop")
      expect(page).to have_link("About")
      expect(page).to have_link("Login")
    end

    it 'has display text' do
      expect(page).to have_content("Shopping Page")
      expect(page).to have_content("Welcome, #{@user.username}, checkout what our store has to offer for you today!")
    end
  end
end