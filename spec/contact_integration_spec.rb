require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('contact addition', {:type => :feature}) do
  it('processes the user entry and returns link to their contact information') do
    visit('/')
    fill_in('first_name', :with => 'Botty')
    fill_in('last_name', :with => 'McBot')
    fill_in('company_name', :with => 'Google')
    fill_in('job_title', :with => 'Ruby Developer')
    choose('p')
    click_button('Add!')
    expect(page).to have_content('Botty McBot')
  end
end
