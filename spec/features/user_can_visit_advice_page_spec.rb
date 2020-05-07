require 'rails_helper'

feature 'user visits the advice page' do
  context 'successfully' do
    before(:each) do
      user = User.create(first_name: 'Nancy',
                         last_name: 'Drew',
                         email: 'nancydrew@detective.com',
                         password: 'test123')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit advice_path
    end

    scenario 'successfully when they are logged in' do
      expect(current_path).to eq(advice_path)
      expect(page).to have_content('Please send friendly advice to a friend.')
    end

    scenario 'and can fill out form to send advice to friend', :vcr do
      fill_in :friends_name, with: 'Leroy Brown'
      fill_in :friends_email, with: "encylopediabrown@detective.com"
      click_button 'Send Advice'

      expect(current_path).to eq(advice_path)
      expect(page).to have_content("Thank you for sending some friendly advice.")
    end
  end

  context 'unsuccessfully' do
    scenario 'when they are not logged in' do
      visit advice_path

      expect(current_path).to eq(root_path)
    end
  end
end
