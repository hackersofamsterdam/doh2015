# Product
class Product < ActiveRecord::Base
  include Tokenizable

  belongs_to :channel

  monetize :price_cents
end
