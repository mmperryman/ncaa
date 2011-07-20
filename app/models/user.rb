class User < ActiveRecord::Base
  acts_as_authentic
  
  has_many :picks, :dependent => :destroy
  has_many :teams, :through => :picks
  
  
  def current_win_total
    total = 0
    picks.find_all_by_period_id(Period.find_by_year('2011')).each do |pick|
      total += pick.team.current_record.wins.to_i
    end
    total
  end
  
  def prev_win_total
    total = 0
    picks.find_all_by_period_id(Period.find_by_year('2011')).each do |pick|
      total += pick.team.prev_record.wins.to_i
    end
    total
  end
end
