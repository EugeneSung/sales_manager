sung = User.create(name: "Sung", username: "sung", title: "Manager", password:"password1")
kims = Client.create(name: "Kims Fine", address: "New York", phone:"222-333-4444", user: sung)
jin = Client.create(name: "Jin Jewelry", address: "New York", phone:"234-567-8888", user: sung)
order1 = Order.create(user: sung, client: jin)
order2 = Order.create(user: sung, client: kims)
item1 = Item.create(name: "Jewel1", price: 10, description: "Beautiful", order: order1)
item2 = Item.create(name: "Jewel2", price: 50, description: "Expensive", order: order1)
item3 = Item.create(name: "Jewel3", price: 20, description: "Fantastic", order: order2)