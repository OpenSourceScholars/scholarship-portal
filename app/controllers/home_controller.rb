class HomeController < ApplicationController
  before_filter :authenticate_admin!, :only => [:admin, :user]

  def index
  end

  def admin
    @users = User.all
  end

  def user
    @user = User.where(:email => params[:email]).first
    puts @user
    @submissions = Submission.where(:user_id => @user.id).all
  end
end
