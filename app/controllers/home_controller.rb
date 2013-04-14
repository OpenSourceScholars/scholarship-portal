class HomeController < ApplicationController
  before_filter :ensure_admin!, :only => [:admin, :downgrade, :user, :show, :upgrade]

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

  def upgrade
    @user = User.where(:email => params[:user][:email]).first
    @user.admin = 1
    @user.save
    flash[:info] = "#{@user.email} is now an admin!"
    redirect_to '/admin'
  end

  def downgrade
    @user = User.where(:email => params[:user][:email]).first
    @user.admin = 0
    @user.save
    flash[:info] = "#{@user.email} is now nothing!"
    redirect_to '/admin'
  end

  private
  def ensure_admin!
    unless current_user && current_user.is_admin?
      flash[:error] = "You are not an admin, silly!"
      redirect_to '/'
    end
  end
end
