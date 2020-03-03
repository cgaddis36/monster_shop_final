require 'rails_helper'

RSpec.describe 'Merchant Order Show Page' do
  before(:each) do
    @merchant = Merchant.create!(name: 'Snowopolis', address: '123 Polar Ave', city: 'Denver', state: 'CO', zip: 80218)
    @merchant_2 = Merchant.create!(name: 'Tractors & Stuff', address: '125 Greenway Blvd', city: 'Denver', state: 'CO', zip: 80218)
    @item_1 = @merchant.items.create!(name: 'Skis', description: "Nice Skis!", price: 500, image: 'https://images.evo.com/imgp/700/139334/589343/clone.jpg', active: true, inventory: 5 )
    @item_2 = @merchant.items.create!(name: 'Snowboard', description: "Shred the slopes!", price: 600, image: 'https://content.backcountry.com/images/items/900/NVS/NVS008S/ONECOL.jpg', active: true, inventory: 3 )
    @item_3 = @merchant_2.items.create!(name: 'Tractor', description: "Let me take a ride on my big green tractor", price: 50, image: 'https://target.scene7.com/is/image/Target/GUEST_a8cb0bab-7915-4ca4-b38a-8b13324f5243?wid=325&hei=325&qlt=80&fmt=webp', active: true, inventory: 3 )
    @bill = @merchant.users.create!(name: "Bill", address: "123 Megs Way", city: "Denver", state: "CO", zip: "12345", email: "bill@example.com", password: "bill", role: 1)
    @meredith = User.create(name: "Meredith", address: "321 Sunny Way", city: "Sunnyville", state: "FL", zip: "32541", email: "meredith@example.com", password: "meredith", role: 0)
  end
  it "on the bulk discounts page I have the option to add discounts based on Item quantity to the items in my shop." do
    visit '/'

    click_on("Log In")

    fill_in "email", with: @bill.email
    fill_in "password", with: @bill.password

    click_button("Log In")

    visit '/merchant/discounts'

    fill_in "name", with: "Discount 1"
    fill_in "desired_quantity", with: "3"
    fill_in "percentage", with: "20"

    click_on("Create Discount")

    click_on("Log Out")

    click_on("Home")

    click_on("Log In")

    fill_in "email", with: @meredith.email
    fill_in "password", with: @meredith.password

    click_button("Log In")

    click_link("Items")

    click_link(@item_1.name)
    click_button("Add to Cart")

    click_link(@item_2.name)
    click_button("Add to Cart")

    click_link("Cart")

    within "#item-#{@item_1.id}" do
      click_button("More of This!")
      click_button("More of This!")
      expect(page).to have_content("Subtotal: $1,200.00")
    end



    save_and_open_page

  end
end
