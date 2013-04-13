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

  validate :wvu_email?

  def is_admin?
    self.admin
  end

  private
  def wvu_email?
    unless self.email.match(/(\.wvu\.edu)$|(afrolegs\.com)$|(gmail\.com)$/)
      errors.add(:email, "Email address must be a wvu address @mail.wvu.edu or @mix.wvu.edu")
    end
  end
end
