require 'rails_helper'

RSpec.describe 'Merchant Order Show Page' do
  before(:each) do
    @merchant = Merchant.create!(name: 'Snowopolis', address: '123 Polar Ave', city: 'Denver', state: 'CO', zip: 80218)
    @merchant_2 = Merchant.create!(name: 'Tractors & Stuff', address: '125 Greenway Blvd', city: 'Denver', state: 'CO', zip: 80218)
    @merchant.items.create!(name: 'Skis', description: "Nice Skis!", price: 500, image: 'https://images.evo.com/imgp/700/139334/589343/clone.jpg', active: true, inventory: 5 )
    @merchant.items.create!(name: 'Snowboard', description: "Shred the slopes!", price: 600, image: 'https://content.backcountry.com/images/items/900/NVS/NVS008S/ONECOL.jpg', active: true, inventory: 3 )
    @merchant_2.items.create!(name: 'Tractor', description: "Let me take a ride on my big green tractor", price: 50, image: 'https://target.scene7.com/is/image/Target/GUEST_a8cb0bab-7915-4ca4-b38a-8b13324f5243?wid=325&hei=325&qlt=80&fmt=webp', active: true, inventory: 3 )
    @bill = @merchant.users.create!(name: "Bill", address: "123 Megs Way", city: "Denver", state: "CO", zip: "12345", email: "bill@example.com", password: "bill", role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@bill)
  end
  it "when I visit the Merchant dashboard I see a link to create bulk discounts" do
    visit '/merchant'

    expect(page).to have_link("Add Bulk Discounts")

    click_link("Add Bulk Discounts")

    expect(current_path).to eq("/merchant/discounts")
  end
  it "on the bulk discounts page I have the option to add discounts based on Item quantity to the items in my shop." do
    visit '/merchant/discounts'

    expect(Discount.all.count).to eq(0)
    expect(page).to have_field("item_quantity")
    expect(page).to have_selector("discount")
  end
end
