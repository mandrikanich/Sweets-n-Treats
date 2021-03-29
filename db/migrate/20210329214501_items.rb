class Items < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |table_helper|
      table_helper.string(:item_name)
      table_helper.string(:description)
      table_helper.string(:price)
    end
  end
end
