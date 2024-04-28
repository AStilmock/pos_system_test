require 'rails_helper'

RSpec.describe 'Website About Page', type: :feature do
  describe 'about page' do
    before :each do
      visit about_index_path
    end

    it 'displays navbar' do
      expect(page).to have_link("Home")
      expect(page).to have_link("Shop")
      expect(page).to have_link("About")
      expect(page).to have_link("Login")
    end

    it 'displays about headline' do
      expect(page).to have_content("Test Website About Us")
    end
    
    it 'has body text' do
      expect(page).to have_content("TEST TEXT TEST TEXT TEST TEXT")
    end
  end
end