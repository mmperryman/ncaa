class Payment < ActiveRecord::Base
  belongs_to :user
  has_one :period
  
  def self.current_payments
    Payment.find_all_by_period_id(Period.find_by_year('2012'))
  end
  
  def self.current_active_payments
    Payment.current_payments.find_all_by_paid(true)
  end
end
