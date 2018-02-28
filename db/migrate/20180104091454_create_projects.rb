class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :client_id
      t.date :start_date
      t.string :status

      t.timestamps
    end
  end
end
