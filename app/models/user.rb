class User < ActiveRecord::Base
  acts_as_authentic
  
  has_many :picks, :dependent => :destroy
  has_many :teams, :through => :picks
  
end
