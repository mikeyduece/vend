require 'rails_helper'
# When I visit a specific snack page
# I see the name of that snack
# I see the price for that snack
# I see a list of locations with vending machines that carry that snack
# I see the average price for snacks in those vending machines
# And I see a count of the different kinds of items in that vending machine.
# ```
feature "User" do
  context "visits snack page" do
    scenario "sees snack name and price" do
      owner = Owner.create!(name: 'Mike', id: 1)
      machine = Machine.create!(id: 1, location: 'turing', owner_id: 1)
      machine_2 = Machine.create!(id: 2, location: 'union station', owner_id: 1)
      snack = Snack.create!(name: 'Cheetos', price: 1.0)
      snack_2 = Snack.create!(name: 'Doritos', price: 4.0)
      machine.snacks << snack
      machine_2.snacks = [snack, snack_2]
      
      visit snack_path(snack)

      expect(page).to have_content(snack.name)
      expect(page).to have_content(snack.price)
    end
    
    scenario "sees locations with machines that carry that snack" do
      owner = Owner.create!(name: 'Mike', id: 1)
      machine = Machine.create!(id: 1, location: 'turing', owner_id: 1)
      machine_2 = Machine.create!(id: 2, location: 'union station', owner_id: 1)
      snack = Snack.create!(name: 'Cheetos', price: 1.0)
      snack_2 = Snack.create!(name: 'Doritos', price: 4.0)
      machine.snacks << snack
      machine_2.snacks = [snack, snack_2]
      
      visit snack_path(snack)
      save_and_open_page
      expect(page).to have_content(machine.location)
      expect(page).to have_content(machine.average_price)
    end
    # 
    # xscenario "sees count of snacks in other machines" do
    #   
    # end
  end
end