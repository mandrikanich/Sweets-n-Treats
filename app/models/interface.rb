class Interface
    attr_accessor :user_name
    attr_reader :prompt  

    def initialize 
        @prompt = TTY::Prompt.new 
    end
    
    
    def welcome
        puts "hi there!".yellow
        puts "come get some sweets n treats".blue
    end

   def ask_for_login_or_register
     #puts "Would you like to login or register?"
     #answer = STDIN.gets.chomp 
     #if answer == "login"
       #login_helper
     #elseif answer == "register"
       #do some register logic
       #register_helper 
     #else
        #generic_warning_message
        #error message
     #end
       prompt.select "Would you like to login or register" do |menu|
        menu.choice "login", -> { login_helper}
        menu.choice "register", -> {register_helper}
       end
     end

   def login_helper
    puts "typed login"
    @user = User.login_helper_class_method 
    puts "welcome #{@user.user_name}" 
   end

   def register_helper 
    puts "typed register"
    @user = User.register_helper_class_method
   end

   def generic_warning_message 
     puts "not login or register, try again"
   end

   def main_menu 
    @user.reload 
    system 'clear'
    sleep 2 
    puts "welcome #{@user.user_name}"
    prompt.select "What do you want to do?" do |menu|
        menu.choice "See all deliveries", -> {see_all_deliveries_helper}
        menu.choice "See all items", -> {see_all_items_helper}
        menu.choice "Exit app", -> {puts "Goodbye"}
    end
   end

   def see_all_deliveries_helper 
    @user.display_deliveries 
    main_menu 
   end


   def see_all_items_helper 
       selected_items = Item.display_items
       binding.pry
       selected_items.add_item_to_delivery("yes", @user.id, selected_items.id)
       main_menu 
   end

   def run 
    welcome
    ask_for_login_or_register
    main_menu 
   end

end