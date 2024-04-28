require 'rails_helper'

RSpec.describe 'Website Landing Page', type: :feature do
  describe 'index page' do
    before :each do
      visit "/"
    end
    it 'displays welcome banner' do
      expect(page).to have_content("Welcome to the TEST POS SYSYEM WEBSITE")
      expect(page).to have_content("Grab all your test merchandise here before it disappears!!")
    end

    it 'displays nav bar' do
      expect(page).to have_link("Home")
      expect(page).to have_link("Shop")
      expect(page).to have_link("About")
      expect(page).to have_link("Login")
    end

    it 'clicks link to home' do
      click_link("Home")
      expect(page).to have_current_path("/")
    end

    it 'clicks link to about' do
      click_link("About")
      expect(page).to have_current_path("/about")
    end

    it 'clicks link to shopping' do
      click_link("Shop")
      expect(page).to have_current_path("/shopping")
    end

    it 'clicks link to login' do
      click_link("Login")
      expect(page).to have_current_path("/login")
    end

    it 'has website info text on page' do
      expect(page).to have_content("This is a test website for a point of sale system.")
      expect(page).to have_content("All sales are final, and all merchandise is fake.")
    end
  end
end