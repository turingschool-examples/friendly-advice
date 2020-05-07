require 'rails_helper'

feature 'user can logout' do
  scenario 'when they click on the logout link' do
    user = User.create(first_name: 'Nancy',
                       last_name: 'Drew',
                       email: 'nancydrew@detective.com',
                       password: 'test123')

    visit root_path

    click_on 'Log in'

    fill_in :email, with: "nancydrew@detective.com"
    fill_in :password, with: 'test123'
    click_on 'Submit'

    expect(page).to have_link('Send Advice')
    expect(page).to have_link('Log out')

    expect(page).to_not have_link('Welcome')
    expect(page).to_not have_link('Register as a user')
    expect(page).to_not have_link('Log in')

    click_on "Log out"

    expect(current_path).to eq(root_path)
    expect(page).to have_link('Welcome')
    expect(page).to have_link('Register as a user')
    expect(page).to have_link('Log in')

    expect(page).to_not have_link('Send Advice')
    expect(page).to_not have_link('Log out')
  end
end
