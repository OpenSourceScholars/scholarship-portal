class Submission < ActiveRecord::Base
  belongs_to :user

  attr_accessible :contribution_link, :description, :project, :project_link, :blurb

  # Validate they supplied this stuff in order to save it.
  #validates :contribution_link, :presence => true
  validates :description, :presence => true
  validates :project, :presence => true
  validates :blurb, :presence => true
  #validates :project_link, :presence => true
end
