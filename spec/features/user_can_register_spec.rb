require 'rails_helper'

feature 'user can register' do
  scenario 'successfully by inputing their info' do

    visit '/registration'

    expect(current_path).to eq(registration_path)

    fill_in 'user[first_name]', with: 'Nancy'
    fill_in 'user[last_name]', with: 'Drew'
    fill_in 'user[email]', with: "nancydrew@detective.com"
    fill_in 'user[password]', with: 'test123'
    click_on 'Register'

    expect(current_path).to eq(advice_path)
    expect(page).to have_content('Please send friendly advice to a friend.')
  end
  scenario 'unsuccessfully by not inputting info' do

    visit '/registration'

    expect(current_path).to eq(registration_path)

    click_on 'Register'

    expect(current_path).to eq(registration_path)
    expect(page).to have_content('Sorry, something went wrong. Please try again.')
  end

end
