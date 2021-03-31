# Seed Your Database 
#delete all users, items, and deliverys from the database
#and then create them whenever we run the file to remove any duplicates
Item.destroy_all
User.destroy_all
Delivery.destroy_all
#reset the IDS so they start at 1
Item.reset_pk_sequence
User.reset_pk_sequence
Delivery.reset_pk_sequence


#USER
matt = User.create(user_name: "Matt Kindt", address: "123 sparrow lane")

10.times do 
    User.create(name: Faker::Name.name)
end

#ITEM
item1 = Item.create(item_name: "fudge brownie", description: "warm chocolate fudge brownie with chocolate chip bits", price: 5)
item2 = Item.create(item_name: "salted carmel brownie", description: "double chocolate brownie featuring homemade carmel sauce", price: 5)
item3 = Item.create(item_name: "chocolate chip cookie", description: "fresh classic made with jumbo chips", price: 3)
item4 = Item.create(item_name: "double chocolate mint cookie", description: "fresh dark chocolate cookie with mint and choclate chips", price: 3)
item5 = Item.create(item_name: "red velet cupcake", description: "classic red velvet topped with buttercream frosting", price: 6)
item6 = Item.create(item_name: "lemon angel food cupcake", description: "light and airy and food cupcake topped with lemon whipped cream frosting", price: 6)
item7 = Item.create(item_name: "chocolate chip muffin", description: "soft and fluffy loaded chocolate chip muffin", price: 7)
item8 = Item.create(item_name: "classic blueberry muffin", description: "soft and light and loaded with fresh blueberries", price: 7)
item9 = Item.create(item_name: "classic glazed donut", description: "freshly glazed right out of the fryer", price: 4)
item10 = Item.create(item_name: "boston cream donut", description: "chocolate frosted with fresh vanilla custard filling", price: 4)
item11 = Item.create(item_name: "classic jelly donut", description: "soft and airy jelly filled donut rolled in sugar", price: 4)
item12 = Item.create(item_name: "classic lemon bar", description: "soft butter shortbread crust with tangy sweet lemon curd filling", price: 8)
item13 = Item.create(item_name: "strawberry lemon bar", description: "soft pink butter shortbread crust with tangy lemon strawberry curd filling", price: 8)
item14 = Item.create(item_name: "apple carmel parfait", description: "layers of sweet carmel with homemade whipped cream and apple pie filling topped with sweet granola", price: 10)
item15 = Item.create(item_name: "layers of our crushed chocolate chip cookies with homemade whipped cream cheesecake layering", price: 10)


#DELIVERY
Delivery.create(delivery_confirmation: "Your order has been delivered!", user: matt, item: item1)
puts "successfully seeded database"

