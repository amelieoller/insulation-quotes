class CreateInsulationTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :insulation_types do |t|
      t.string :name
      t.string :description
      t.decimal :coverage
      t.integer :r_value
      t.decimal :thickness
      t.decimal :width
      t.string :facing
      t.decimal :price

      t.timestamps
    end
  end
end
