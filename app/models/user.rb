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

end