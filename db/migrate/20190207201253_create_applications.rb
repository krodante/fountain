class CreateApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :applications do |t|
      t.integer :applicant_id, null: false
      t.integer :job_id, null: false

      t.timestamps
    end

    add_index :applications, [:applicant_id, :job_id], unique: true
  end
end
