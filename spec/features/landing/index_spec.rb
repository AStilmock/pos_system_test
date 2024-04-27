require 'rails_helper'

RSpec.describe 'Website Landing Page', type: :feature do
  describe 'index page' do
    it 'displays welcome banner' do
      visit "/"
      expect(page).to have_content("Welcome to the TEST POS SYSYEM WEBSITE - grab all your test merchandise here before it's all gone!")
    end

    it 'displays nav bar' do

    end

    it 'displays footer' do

    end

    it 'link to shop' do
      
    end

    it 'link to about' do

    end

    it 'has website info text on page' do

    end
  end
end