class Submission < ActiveRecord::Base
  belongs_to :user

  attr_accessible :contribution_link, :description, :project, :project_link, :blurb

  # Validate they supplied this stuff in order to save it.
  validates :project, :presence => true
  validates :blurb, :presence => true
end
