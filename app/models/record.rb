class Record < ActiveRecord::Base
  belongs_to :team
  has_one :period
end
