class Item < ActiveRecord::Base
   has_many :deliveries 
   has_many :users, through: :deliveries
end