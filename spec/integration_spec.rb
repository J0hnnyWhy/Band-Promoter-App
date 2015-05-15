ENV['RACK_ENV'] = 'test'
require('capybara/rspec')
require('./app')
require('spec_helper')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('Band Promoter App', type: :feature) do
  describe('add band functionality') do
    it('adds a new band') do
      visit('/')
      fill_in('name', with: 'Peanut Butter')
      click_button('Add Band')
      expect(page).to(have_content('Peanut Butter'))
    end
  end

  describe('view a band and their venues') do
    it('allow a user to rename a band') do
      Band.create(name: 'The Appetizers')
      visit('/band/')
      click_link('band_add')
      expect(page).to(have_content('The Appetizers'))
    end
  end

  describe('delete a band') do
    it('allow a user to remove a band') do
      Band.create(name: 'The Appetizers')
      visit('/band/:id')
      click_button('Delete')
      expect(page).to(have_content(''))
    end
  end




end
