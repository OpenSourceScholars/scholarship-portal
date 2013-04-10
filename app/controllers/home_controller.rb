class HomeController < ApplicationController
  before_filter :authenticate_admin!, :only => [:admin]

  def index
  end

  def admin
    @users = User.all
  end
end
