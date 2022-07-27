class PagesController < ApplicationController

  def dashboard
    @user = current_user
    @freelancer = Freelancer.new
  end
end
