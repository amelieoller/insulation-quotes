class CreateInsulationTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :insulation_types do |t|
      t.references :application, foreign_key: true      
      t.string :name
      t.integer :oc
      t.string :framing
      t.string :r_value
      t.integer :thickness
      t.integer :width
      t.string :facing
      t.integer :price

      t.timestamps
    end
  end
end
