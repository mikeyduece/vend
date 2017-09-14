require 'rails_helper'

feature "User" do
  context "visits machine show page" do
    scenario "sees all item for that machine" do
      owner = Owner.create!(name: 'Mike', id: 1)
      machine = Machine.create!(id: 1, location: 'turing', owner_id: 1)
      snack = Snack.create!(name: 'Cheetos', price: 1.0)
      snack_2 = Snack.create!(name: 'Doritos', price: 4.0)
      machine.snacks << snack

      visit machine_path(machine)

      expect(page).to have_content(snack.name)
    end
    
    scenario "see average price for all snacks" do
      owner = Owner.create!(name: 'Mike', id: 1)
      machine = Machine.create!(id: 1, location: 'turing', owner_id: 1)
      snack = Snack.create!(name: 'Cheetos', price: 1.0)
      snack_2 = Snack.create!(name: 'Doritos', price: 4.0)
      machine.snacks << snack

      visit machine_path(machine)

      expect(page).to have_content(machine.average_price)
    end
  end
end