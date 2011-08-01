class Team < ActiveRecord::Base
  has_many :records
  belongs_to :picks, :dependent => :destroy
  accepts_nested_attributes_for :records
  def current_record
    records.where(:period_id => Period.find_by_year('2011')).first
  end
  
  def prev_record
    records.where(:period_id => Period.find_by_year('2010')).first
  end
end

class Array
  def dissect(chunk_size)
    each_slice(chunk_size).reduce([]) {|x,y| x += [y] }
  end
  alias / chunk
end