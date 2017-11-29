class AddCustomerIdToQuote < ActiveRecord::Migration[5.1]
  def change
    add_reference :quotes, :customer, index: true
  end
end
