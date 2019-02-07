class CreateApplicants < ActiveRecord::Migration[5.2]
  def change
    create_table :applicants do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.integer :user_id, null: false

      t.timestamps
    end

    add_index :applicants, :user_id, unique: true
  end
end
