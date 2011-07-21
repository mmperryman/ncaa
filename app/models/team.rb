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
  def dissect(number_of_chunks)
    chunks = (1..number_of_chunks).collect { [] }
    while self.any?
      chunks.each do |a_chunk|
        a_chunk << self.shift if self.any?
      end
    end
    chunks
  end
  alias / chunk
end