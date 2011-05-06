class Specialty < ActiveRecord::Base
  has_many :chair_specialty
  has_many :chair, :through => :chair_specialty
end

