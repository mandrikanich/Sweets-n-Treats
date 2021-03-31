class User < ActiveRecord::Base
    has_many :deliveries 
    has_many :items, through: :deliveries 

    def self.login_helper_class_method
        puts "What is your username?"
        username = STDIN.gets.chomp
        puts "What is your password?"
        password = STDIN.gets.chomp 
        user_instance = User.find_by({username: username, password: password})
    
        until user_instance
            puts "incorrect username or password"
            sleep 1
            system 'clear'
            user_instance = User.login_helper_class_method
        end

        user_instance
    end

    def self.register_helper_class_method
        puts "What is your username?"
        username = STDIN.gets.chomp
        puts "What is your password?"
        password = STDIN.gets.chomp 
        user_instance = User.create({username: username, password: password})
    end

    def display_items
        if items.length > 0 


         array_of_hashes = items.map do |item|
             { item.title => item.id }
         end
         
         item_id = TY::Prompt.new.select("What item would you like to see?", )
         puts "You chose item with ID of #{item_id}"

        else 
            puts "Sorry you don't have items to display."
        end
    end

end