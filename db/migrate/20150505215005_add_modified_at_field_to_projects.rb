class AddModifiedAtFieldToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :modified_at, :datetime
  end
end
