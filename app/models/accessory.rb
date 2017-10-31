class Accessory < ApplicationRecord
   has_many :accessories_quotes
   has_many :quotes, through: :accessories_quotes

   validates :name, presence: true
end
