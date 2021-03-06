class CreateEmployers < ActiveRecord::Migration[5.2]
  def change
    create_table :employers do |t|
      t.string :name
      t.integer :user_id

      t.timestamps
    end

    add_index :employers, :user_id, unique: true
  end
end
