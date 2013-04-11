class HomeController < ApplicationController
  before_filter :authenticate_admin!, :only => [:admin, :user, :show]

  def index
  end

  def admin
    @users = User.all.sort_by { |user| user.email }
  end

  def user
    @user = User.where(:email => params[:email]).first
    @submissions = Submission.where(:user_id => @user.id).all
  end

  def show
    @user = User.where(:email => params[:email]).first
    @submission = Submission.find(params[:id])
  end
end
