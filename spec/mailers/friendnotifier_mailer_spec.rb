require 'rails_helper'

RSpec.describe FriendNotifierMailer, type: :mailer do
  describe 'inform' do
    sending_user = User.create(
      first_name: 'Nancy',
      last_name: 'Drew',
      email: 'nancy.drew@detectives.com',
      password: 'magnifyingglass'
    )

    email_info = {
      user: sending_user,
      friend: 'Encylopedia Brown',
      message: 'What do you call an alligator that wears a vest? An Investigator!'
    }

    let(:mail) { FriendNotifierMailer.inform(email_info, 'encylopedia.brown@detectives.com') }

    it 'renders the headers' do
      expect(mail.subject).to eq('Nancy Drew is sending you some advice')
      expect(mail.to).to eq(['encylopedia.brown@detectives.com'])
      expect(mail.from).to eq(['friendly@advice.io'])
      expect(mail.reply_to).to eq(['nancy.drew@detectives.com'])
    end

    it 'renders the body' do
      expect(mail.text_part.body.to_s).to include('Hello Encylopedia Brown')
      expect(mail.text_part.body.to_s).to include('Nancy Drew has sent you some advice: What do you call an alligator that wears a vest? An Investigator!')

      expect(mail.html_part.body.to_s).to include('Hello Encylopedia Brown')
      expect(mail.html_part.body.to_s).to include('Nancy Drew has sent you some advice: What do you call an alligator that wears a vest? An Investigator!')

      expect(mail.body.encoded).to include('Hello Encylopedia Brown')
      expect(mail.body.encoded).to include('Nancy Drew has sent you some advice: What do you call an alligator that wears a vest? An Investigator!')
    end
  end
end
