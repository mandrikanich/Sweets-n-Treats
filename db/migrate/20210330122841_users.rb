class Users < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |table_helper|
      table_helper.string(:user_name)
      table_helper.string(:address)
    end
  end
end
