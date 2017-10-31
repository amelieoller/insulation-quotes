class Accessory < ApplicationRecord
   has_many :quotes_accessories
   has_many :quotes, through: :accessories

   validates :name, presence: true
end
