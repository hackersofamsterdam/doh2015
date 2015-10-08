class Channel < ActiveRecord::Base
  include Tokenizable

  belongs_to :user
  has_many :products
end
