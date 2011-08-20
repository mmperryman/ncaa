class User < ActiveRecord::Base
  acts_as_authentic do |c|
    c.login_field = :email
  end
  
  has_many :picks, :dependent => :destroy
  has_many :teams, :through => :picks

  has_many :payments, :dependent => :destroy
  accepts_nested_attributes_for :payments
  
  validates_uniqueness_of :team_name
  validates_uniqueness_of :email
  
  BACKGROUNDS = [['Blue Sky','bluesky.jpg'], 
                 ['Gator Mix-Up','gator_mixup.jpg'],
                 ['UCF Knights', 'knights.jpg'],
                 ['Boise Smurf Turf','smurf_turf.jpg'],
                 ['Tecmo Bowl', 'tecmo.png'],
                 ['Incognito','spreadsheet.png']]
  
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
  
  def admin?
    email == "mmperryman@gmail.com"
  end
  
  def self.find_by_login_or_email(login)
     find_by_login(login) || find_by_email(login)
  end
end