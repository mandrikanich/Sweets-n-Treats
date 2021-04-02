class Delivery < ActiveRecord::Base
     belongs_to :user
     belongs_to :item
end


def display_deliveries
    if deliveries.length > 0
        array_of_hashes = deliveries.map do |deliveries|
            { deliveries.item.item_name => deliveries.id }
        end
        delivery_id = TTY::Prompt.new.select("What item would you like to see?", array_of_hashes)
        puts "You chose item with ID of #{delivery_id}"
    else 
        puts "Sorry you don't have any items to display!"
    end
end

def delivery_total_cost 
    total = 0
    
    
end