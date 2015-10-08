class Channel < ActiveRecord::Base
  include Tokenizable

  belongs_to :user
end
