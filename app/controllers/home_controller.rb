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
    respond_to do |format|
      if @user.make_admin
        format.html { redirect_to '/admin', notice: "#{@user.email} is now an admin!" }
      else
        format.html { redirect_to '/admin', notice: "Failed to update users table!" }
      end
    end
  end

  def downgrade
    @user = User.where(:email => params[:user][:email]).first
    respond_to do |format|
      if @user.revoke_admin
        format.html { redirect_to '/admin', notice: "#{@user.email} is now nothing!" }
      else
        format.html { redirect_to '/admin', notice: "Failed to update users table!" }
      end
    end
  end

  private
  def ensure_admin!
    unless current_user && current_user.is_admin?
      flash[:error] = "You are not an admin, silly!"
      redirect_to '/'
    end
  end
end
