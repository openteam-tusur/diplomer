class Chair < ActiveRecord::Base
  belongs_to  :faculty
  has_one     :role
  has_many    :chair_specialty
  has_many    :specialty, :through => :chair_specialty
end

