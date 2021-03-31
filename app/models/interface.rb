class Interface
    attr_accessor :user 
    
    
    def welcome
        puts "hi there!"
        puts "come get some sweets n treats"
    end

   def ask_for_login_or_register
     puts "Would you like to login or register?"
     answer = STDIN.gets.chomp 
     if answer == "login"
        #do some login logic
       login_helper
     elseif answer == "register"
       #do some register logic
       register_helper 
     else
        generic_warning_message
        #error message
     end
     
   end

   def login_helper
    puts "typed login"
    @user = User.login_helper_class_method 
    puts "welcome #{user.username}" 
   end

   def register_helper 
    puts "typed register"
    @user = User.register_helper_class_method
   end

   def generic_warning_message 
     puts "not login or register, try again"
   end

   def main_menu 
    puts "welcome #{user.username}"
   end

   def run 
    welcome
    ask_for_login_or_register
    main_menu 
   end

end