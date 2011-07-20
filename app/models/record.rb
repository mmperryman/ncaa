class Record < ActiveRecord::Base
  has_one :team
  has_one :period
end
