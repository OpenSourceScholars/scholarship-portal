class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.string :project
      t.string :project_link
      t.string :contribution_link
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end
end
