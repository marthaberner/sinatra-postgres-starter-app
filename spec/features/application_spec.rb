require 'spec_helper'
require 'capybara/rspec'

Capybara.app = Application

feature 'Motorcycles' do
  scenario 'User can add, edit and delete motorcycles' do
    visit '/'
    ## Add motorcycle
    click_link 'Add A Motorcycle'
    fill_in 'name', with: 'Honda Rebel'
    fill_in 'description', with: '1975, 650 CC'
    click_on 'Add Motorcycle'

    expect(page).to have_content 'Honda Rebel'
    expect(page).to have_content '1975, 650 CC'

    ## Read motorcycle
    click_link 'Honda Rebel'

    expect(page).to have_content 'Honda Rebel'
    expect(page).to have_content '1975, 650 CC'

    ## Update motorcycle
    click_link 'Edit'
    fill_in 'name', with: 'Suzuki'
    fill_in 'description', with: '1977, 650 CC'
    click_on 'Update Motorcycle'

    expect(page).to have_no_content 'Honda Rebel'
    expect(page).to have_no_content '1984, 650 CC'

    expect(page).to have_content 'Suzuki'
    expect(page).to have_content '1977, 650 CC'
  end
end