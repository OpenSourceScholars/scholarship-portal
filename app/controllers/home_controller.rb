class HomeController < ApplicationController
  require 'ipaddr'

  before_filter :ensure_admin!, :only => [:admin, :downgrade, :user, :show, :upgrade]
  before_filter :ensure_github, :only => [:deploy]

  # GET /
  def index
  end

  # GET /admin
  def admin
    @users = User.all.sort_by { |user| user.email }
  end

  def deploy
      system './deploy.sh'
      head :ok
  end

  # GET /users/:email
  def user
    @user = User.where(:email => params[:email]).first
    @submissions = Submission.where(:user_id => @user.id, :active => true).all
  end

  # GET /users/:email/:id
  def show
    @user = User.where(:email => params[:email]).first
    @submission = Submission.find(params[:id])
  end

  # POST /users/upgrade
  def upgrade
    @user = User.where(:email => params[:user][:email]).first
    respond_to do |format|
      if @user.make_admin
        format.html { redirect_to '/admin', notice: "#{@user.email} is now an admin!" }
      else
        format.html { redirect_to '/admin', notice: "#{@user.errors.full_messages}" }
      end
    end
  end

  # POST /users/downgrade
  def downgrade
    @user = User.where(:email => params[:user][:email]).first
    respond_to do |format|
      if @user.revoke_admin
        format.html { redirect_to '/admin', notice: "#{@user.email} is now nothing!" }
      else
        format.html { redirect_to '/admin', notice: "#{@user.errors.full_messages}" }
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

  def github_blocks
    %w{
        207.97.227.253/32
        50.57.128.197/32
        108.171.174.178/32
        50.57.231.61/32
        204.232.175.64/27
      }.map { |subnet| IPAddr.new subnet }
  end

  def ensure_github
    if not github_blocks.any? { |block| block.include?(request.remote_ip) }
      redirect_to '/'
    end
  end
end
