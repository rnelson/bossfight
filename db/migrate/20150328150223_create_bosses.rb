class CreateBosses < ActiveRecord::Migration
  def change
    create_table :bosses do |t|
      t.integer :employee_id
      t.integer :boss_id

      t.timestamps null: false
    end
  end
end
