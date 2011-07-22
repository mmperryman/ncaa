class Record < ActiveRecord::Base
  belongs_to :team, :dependent => :destroy
  has_one :period
end
