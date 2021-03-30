class Deliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |table_helper|
      table_helper.string :delivery_confirmation
      table_helper.integer :user_id
      table_helper.integer :item_id
    end
  end
end
