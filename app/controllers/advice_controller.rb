class AdviceController < ApplicationController

  def show
    redirect_to root_path unless logged_in?
  end

  def create
    @advice = AdviceGenerator.new
    # `recipient` is the email address that should be receiving the message
    recipient = params[:friends_email]

    # `email_info` is the information that we want to include in the email message.
    email_info = {
      user: current_user,
      friend: params[:friends_name],
      message: @advice.message
    }

    FriendNotifierMailer.inform(email_info, recipient).deliver_now
    flash[:notice] = 'Thank you for sending some friendly advice.'
    redirect_to advice_url
  end
end
