class User < ActiveRecord::Base
    has_many :deliveries 
    has_many :items, through: :deliveries 

    def self.login_helper_class_method
        puts "What is your username?".blue
        user_name = STDIN.gets.chomp
        puts "What is your password?".blue
        password = STDIN.gets.chomp 
        user_instance = User.find_by({user_name: user_name, password: password})
    
        until user_instance
            puts "incorrect username or password"
            sleep 1
            user_instance = User.login_helper_class_method
        end

        user_instance
    end

    def self.register_helper_class_method
        puts "What is your username?"
        user_name = STDIN.gets.chomp
        puts "What is your password?"
        password = STDIN.gets.chomp 
        user_instance = User.create({user_name: user_name, password: password})
    end

    def display_items
        if items.length > 0
            array_of_hashes = items.map do |items|
                { items.delivery.delivery_name => items.id }
            end
            item_id = TTY::Prompt.new.select("What item would you like to see?", array_of_hashes)
            puts "You chose item with ID of #{item_id}"
        else 
            puts "Sorry you don't have any items to display!"
        end
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

end