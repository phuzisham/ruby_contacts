require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('contact addition', {:type => :feature}) do
  it('processes the user entry and returns link to their contact information') do
    visit('/')
    fill_in('first_name', :with => 'Eddie')
    fill_in('last_name', :with => 'Hazel')
    fill_in('number', :with => '555-186-2823')
    click_button('Add!')
    expect(page).to have_content('Eddie Hazel')
  end
end
