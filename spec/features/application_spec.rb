require 'spec_helper'
require 'capybara/rspec'

Capybara.app = Application

feature 'Motorcycles' do
  scenario 'User can add, edit and delete motorcycles' do
    visit '/'
    ## Add Motorcycle
    click_link 'Add A Motorcycle'
    fill_in 'name', with: 'Honda Rebel'
    fill_in 'description', with: '1975, 650 CC'
    click_on 'Add Motorcycle'

    expect(page).to have_content 'Honda Rebel'
    expect(page).to have_content '1975, 650 CC'

    ## Read Motorcycle
    click_link 'Honda Rebel'

    expect(page).to have_content 'Honda Rebel'
    expect(page).to have_content '1975, 650 CC'

  end
end