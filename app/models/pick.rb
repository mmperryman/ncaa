class Pick < ActiveRecord::Base
  belongs_to :user
  has_one :period
  has_one :team
end
