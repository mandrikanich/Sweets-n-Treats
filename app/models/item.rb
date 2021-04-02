require 'pry'
class Item < ActiveRecord::Base
   has_many :deliveries 
   has_many :users, through: :deliveries
  

  def self.display_items
     if Item.all.length > 0
        array_of_hashes = Item.all.map do |items|
            { items.item_name => items.id }
        end
        item_id = TTY::Prompt.new.select("What item would you like to see?", array_of_hashes)
        puts Item.distinct.pluck(:description)
        Item.find_by({item_name: item_name, item_id: item_id})
     else 
        puts "Sorry you don't have any items to display!"
     end

   end
   
   def add_item_to_delivery(delivery_confirmation, user_id, item_id)
    Delivery.create({delivery_confirmation: delivery_confirmation, user_id: user_id, item_id: item_id}) 
   end
end