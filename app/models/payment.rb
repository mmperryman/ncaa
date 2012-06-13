class Payment < ActiveRecord::Base
  belongs_to :user
  has_one :period
  
  def self.current_payments
    Payment.find_all_by_period_id(Period.find_by_year('2012'))
  end
end
