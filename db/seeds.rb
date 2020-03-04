# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


megan = Merchant.create!(name: 'Megans Marmalades', address: '123 Main St', city: 'Denver', state: 'CO', zip: 80218)
brian = Merchant.create!(name: 'Brians Bagels', address: '125 Main St', city: 'Denver', state: 'CO', zip: 80218)
luke = Merchant.create!(name: 'Lukes Lollipops', address: '125 Lolli St', city: 'Denver', state: 'CO', zip: 80218)
sherry = Merchant.create!(name: 'Sherrys Shells', address: '125 Sherry St', city: 'Denver', state: 'CO', zip: 80218)
megan.items.create!(name: 'Ogre', description: "I'm an Ogre!", price: 20, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaLM_vbg2Rh-mZ-B4t-RSU9AmSfEEq_SN9xPP_qrA2I6Ftq_D9Qw', active: true, inventory: 5 )
megan.items.create!(name: 'Giant', description: "I'm a Giant!", price: 50, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaLM_vbg2Rh-mZ-B4t-RSU9AmSfEEq_SN9xPP_qrA2I6Ftq_D9Qw', active: true, inventory: 3 )
brian.items.create!(name: 'Hippo', description: "I'm a Hippo!", price: 50, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaLM_vbg2Rh-mZ-B4t-RSU9AmSfEEq_SN9xPP_qrA2I6Ftq_D9Qw', active: true, inventory: 3 )
brian.items.create!(name: 'Fairy', description: "I'm a Fairy!", price: 10, image: 'https://image.shutterstock.com/image-vector/cute-little-fairy-beautiful-long-260nw-641912509.jpg', active: true, inventory: 6 )
sherry.items.create!(name: 'Conch', description: "I'm a Conch!", price: 40, image: 'https://cdn11.bigcommerce.com/s-36f60/images/stencil/original/products/1488/1970/pink_conch_1__62107.1375986284.jpg?c=2&imbypass=on', active: true, inventory: 5 )
sherry.items.create!(name: 'Shell', description: "I'm a Shell!", price: 9, image: 'https://static.turbosquid.com/Preview/2014/05/26__18_45_50/seashell.jpga259bcf6-3c5e-4448-ba44-405bb941bbe9DefaultHQ.jpg', active: true, inventory: 9 )
luke.items.create!(name: 'Lollipop', description: "I'm a Lollipop!", price: 1, image: 'https://partycity6.scene7.com/is/image/PartyCity/_pdp_sq_?$_1000x1000_$&$product=PartyCity/633065', active: true, inventory: 16 )
luke.items.create!(name: 'Dum Dum', description: "I'm a Dum Dum!", price: 3, image: 'https://cdns.crestline.com/master/101023/web/101023_90A.jpg?s=600', active: true, inventory: 11 )
merchant = megan.users.create!(name: "Megan", address: "123 Megs Way", city: "Denver", state: "CO", zip: "12345", email: "meg@example.com", password: "meg", role: 1)
merchant2 = brian.users.create!(name: "Brian", address: "123 Brians Way", city: "Denver", state: "CO", zip: "12345", email: "brian@example.com", password: "brian", role: 1)
merchant3 = luke.users.create!(name: "Luke", address: "123 Lukes Way", city: "Denver", state: "CO", zip: "12345", email: "luke@example.com", password: "luke", role: 1)
merchant4 = sherry.users.create!(name: "Sherry", address: "123 Sherrys Way", city: "Denver", state: "CO", zip: "12345", email: "sherry@example.com", password: "sherry", role: 1)
