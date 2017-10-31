class CreateJoinTableQuotesAccessories < ActiveRecord::Migration[5.1]
  def change
    create_join_table :quotes, :accessories do |t|
      t.index [:quote_id, :accessory_id]
      t.index [:accessory_id, :quote_id]
    end
  end
end
