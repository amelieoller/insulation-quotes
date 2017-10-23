class CreateApplications < ActiveRecord::Migration[5.1]
  def change
    create_table :applications do |t|
      t.references :quote, foreign_key: true
      t.string :application_type
      t.string :description
      t.integer :oc
      t.string :framing
      t.string :r_value
      t.decimal :depth
      t.decimal :length
      t.decimal :width
      t.decimal :height
      t.string :vapor_barrier
      t.integer :bags_needed
      t.decimal :square_foot_price    

      t.timestamps
    end
  end
end
