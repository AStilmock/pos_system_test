require 'rails_helper'

RSpec.describe 'Website Landing Page', type: :feature do
  describe 'index page' do
    before :each do
      visit root_path
    end
    it 'displays welcome banner' do
      expect(page).to have_content("Welcome to the TEST POS SYSYEM WEBSITE")
      expect(page).to have_content("Grab all your test merchandise here before it disappears!!")
    end

    it 'displays nav bar' do
      expect(page).to have_link("Home")
      expect(page).to have_link("Register")
      expect(page).to have_link("Login")
    end

    it 'clicks link to home' do
      click_link("Home")
      expect(current_path).to eq root_path
    end

    it 'clicks link to login' do
      click_link("Login")
      expect(current_path).to eq login_path
    end

    it 'has website info text on page' do
      expect(page).to have_content("This is a test website for a point of sale system.")
      expect(page).to have_content("All sales are final, and all merchandise is fake.")
    end
  end
end