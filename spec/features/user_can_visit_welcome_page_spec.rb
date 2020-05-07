require 'rails_helper'

feature 'user can visit welcome page' do
  scenario 'when visiting the root path' do
    visit root_path

    expect(current_path).to eq (root_path)
    expect(page).to have_content('Welcome to Friendly Advice!')
    expect(page).to have_link('Register as a user')
    expect(page).to have_link('Log in')

    expect(page).to_not have_link('Send Advice')
    expect(page).to_not have_link('Log out')
  end
end
