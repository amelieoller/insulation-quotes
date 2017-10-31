class AccessoriesQuote < ApplicationRecord
   belongs_to :quote
   belongs_to :accessory
end