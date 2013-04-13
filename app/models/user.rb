class User < ActiveRecord::Base

  has_many :submissions

  # Include default devise modules. Others available are:
  # :token_authenticatable,
  # :lockable, :timeoutable and :omniauthable
  devise :confirmable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  validate :valid_email?

  def is_admin?
    self.admin
  end

  private
  def valid_email?
    if Rails.env.production?
      unless self.email.match(/(\.wvu\.edu)$/)
        errors.add(:email, "address must be a wvu address @mail.wvu.edu or @mix.wvu.edu")
      end
    end
  end
end
