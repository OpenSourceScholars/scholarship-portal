class AddActiveToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :active, :boolean
    Submission.update_all(:active => false)
  end
end
