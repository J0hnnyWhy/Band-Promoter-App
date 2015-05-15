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
      click_button('Add')
      expect(page).to(have_content('Peanut Butter'))
    end
  end
end
