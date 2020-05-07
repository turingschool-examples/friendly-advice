class AdviceController < ApplicationController

  def show
    redirect_to root_path unless logged_in?
  end

  def create
    @advice = AdviceGenerator.new
  end
end
