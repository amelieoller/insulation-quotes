class CreateApplications < ActiveRecord::Migration[5.1]
  def change
    create_table :applications do |t|
      t.references :quote, foreign_key: true
      t.string :application_type
      t.string :description
      t.integer :oc
      t.string :framing
      t.string :r_value
      t.integer :depth
      t.integer :length
      t.integer :width
      t.integer :height
      t.string :vapor_barrier

      t.timestamps
    end
  end
end
