class Period < ActiveRecord::Base
  belongs_to :picks
  belongs_to :records
end
