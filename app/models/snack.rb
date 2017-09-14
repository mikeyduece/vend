class Snack < ApplicationRecord
  has_many :machine_snacks
  has_many :machines, through: :machine_snacks
  
  def price_usd
    (price/100)+ 0.99
  end
end
