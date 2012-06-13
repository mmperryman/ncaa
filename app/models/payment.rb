class Payment < ActiveRecord::Base
  belongs_to :user
  has_one :period
  
  def self.current_payments
    Payment.where(:period_id => Period.find_by_year('2012'))
  end
  
  def self.current_active_payments
    Payment.where(:paid => true, :period_id => Period.find_by_year('2012'))
  end
end
