class Interface
    attr_accessor :user, :item
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
       prompt.select "Would you like to login or register".yellow do |menu|
        menu.choice "login".red, -> { login_helper}
        menu.choice "register".red, -> {register_helper}
      end
     end

   def login_helper
    puts "typed login".cyan
    @user = User.login_helper_class_method 
    puts "welcome #{user.user_name}".yellow
   end

   def register_helper 
    puts "typed register"
    @user = User.register_helper_class_method
   end

   def generic_warning_message 
     puts "not login or register, try again".red
   end

   def main_menu 
    @user.reload 
    
    sleep 2 
    puts "welcome #{user.user_name}"
    prompt.select "What do you want to do?".blue do |menu|
        menu.choice "See all deliveries".cyan, -> {see_all_deliveries_helper}
        menu.choice "See all items".cyan, -> {see_all_items_helper}
        menu.choice "Exit app".red, -> {puts "Goodbye".pink}
    end
   end

   def see_all_deliveries_helper
    @user.display_deliveries
    main_menu

   end

   def see_all_items_helper
     Item.display_items
     main_menu 
   end

   def run 
    welcome
    ask_for_login_or_register
    main_menu 
   end

end