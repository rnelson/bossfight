class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.integer :status
      t.integer :priority
      t.integer :boss_id
      t.integer :employee_id

      t.timestamps null: false
    end
  end
end
