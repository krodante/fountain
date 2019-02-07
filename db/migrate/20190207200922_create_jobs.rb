class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :description
      t.integer :employer_id, null: false

      t.timestamps
    end

    add_index :jobs, :employer_id
  end
end
