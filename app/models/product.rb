# Product
class Product < ActiveRecord::Base
  belongs_to :channel

  monetize :price_cents
end
