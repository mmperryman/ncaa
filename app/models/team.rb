class Team < ActiveRecord::Base
  has_many :records
  belongs_to :picks, :dependent => :destroy
  accepts_nested_attributes_for :records
end
