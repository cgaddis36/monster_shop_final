require 'rails_helper'

RSpec.describe 'Merchant Order Show Page' do
  before(:each) do
    @merchant = Merchant.create!(name: 'Megans Marmalades', address: '123 Main St', city: 'Denver', state: 'CO', zip: 80218)
    @merchant_2 = Merchant.create!(name: 'Brians Bagels', address: '125 Main St', city: 'Denver', state: 'CO', zip: 80218)
    @merchant.items.create!(name: 'Ogre', description: "I'm an Ogre!", price: 20, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaLM_vbg2Rh-mZ-B4t-RSU9AmSfEEq_SN9xPP_qrA2I6Ftq_D9Qw', active: true, inventory: 5 )
    @merchant.items.create!(name: 'Giant', description: "I'm a Giant!", price: 50, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaLM_vbg2Rh-mZ-B4t-RSU9AmSfEEq_SN9xPP_qrA2I6Ftq_D9Qw', active: true, inventory: 3 )
    @merchant_2.items.create!(name: 'Hippo', description: "I'm a Hippo!", price: 50, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaLM_vbg2Rh-mZ-B4t-RSU9AmSfEEq_SN9xPP_qrA2I6Ftq_D9Qw', active: true, inventory: 3 )
    @megan = @merchant.users.create!(name: "Megan", address: "123 Megs Way", city: "Denver", state: "CO", zip: "12345", email: "meg@example.com", password: "meg", role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@megan)
  end
  it "when I visit the Merchant dashboard I see a link to create bulk discounts" do
    visit '/merchant'

    expect(page).to have_link("Add Bulk Discounts")

    click_link("Add Bulk Discounts")

    expect(current_path).to eq("/merchant/items/discounts")
save_and_open_page

  end
end
