class Chair < ActiveRecord::Base
  belongs_to  :faculty
  has_one     :role
end

