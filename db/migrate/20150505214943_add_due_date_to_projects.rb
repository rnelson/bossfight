class AddDueDateToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :due_at, :date
  end
end
