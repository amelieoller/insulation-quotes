class CreateInsulationTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :insulation_types do |t|
      t.string :name
      t.integer :coverage
      t.integer :r_value
      t.integer :thickness
      t.integer :width
      t.string :facing
      t.integer :price

      t.timestamps
    end
  end
end
