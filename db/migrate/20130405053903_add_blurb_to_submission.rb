class AddBlurbToSubmission < ActiveRecord::Migration
  def change
    add_column :submissions, :blurb, :string
  end
end
