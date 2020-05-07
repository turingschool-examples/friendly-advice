require 'rails_helper'

feature 'user can log in' do
  scenario 'successfully by inputing their info' do
    user = User.create(first_name: 'Nancy',
                       last_name: 'Drew',
                       email: 'nancydrew@detective.com',
                       password: 'test123')

    visit login_path

    expect(current_path).to eq(login_path)

    fill_in :email, with: "nancydrew@detective.com"
    fill_in :password, with: 'test123'
    click_on 'Submit'

    expect(current_path).to eq(advice_path)
    expect(page).to have_content("Welcome, #{user.first_name}!")
    expect(page).to have_content('Please send friendly advice to a friend.')
  end
  scenario 'unsuccessful if user enters incorrect password' do
    user = User.create(first_name: 'Nancy',
                       last_name: 'Drew',
                       email: 'nancydrew@detective.com',
                       password: 'test123')

    visit '/login'

    expect(current_path).to eq(login_path)

    fill_in :email, with: "nancydrew@detective.com"
    fill_in :password, with: 'test'
    click_on 'Submit'

    expect(current_path).to eq(login_path)
  end
end
