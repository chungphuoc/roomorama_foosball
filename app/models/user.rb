class User < ActiveRecord::Base
  has_many :team_users
  belongs_to :team
  validates :first_name, presence: true
  validates :last_name, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
