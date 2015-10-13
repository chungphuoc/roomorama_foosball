class Team < ActiveRecord::Base
  has_one :user
  belongs_to :match
end
