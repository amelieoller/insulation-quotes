class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :street
      t.string :city
      t.integer :zip_code
      t.string :state
      t.integer :rating

      t.timestamps
    end
  end
end
