class User < ActiveRecord::Base
    has_many :deliveries
    has_many :items, through: :deliveries

end