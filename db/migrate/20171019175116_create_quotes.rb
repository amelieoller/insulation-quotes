class CreateQuotes < ActiveRecord::Migration[5.1]
  def change
    create_table :quotes do |t|
      t.references :user, foreign_key: true
      t.string :customer_name
      t.string :street
      t.string :city
      t.integer :zip_code
      t.string :state
      t.integer :amount

      t.timestamps
    end
  end
end
