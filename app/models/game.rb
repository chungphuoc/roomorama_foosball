class Game < ActiveRecord::Base
  has_one :match_game, dependent: :destroy
end
