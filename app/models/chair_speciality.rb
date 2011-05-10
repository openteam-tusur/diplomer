class ChairSpeciality < ActiveRecord::Base
  belongs_to :chair
  belongs_to :speciality
end


# == Schema Information
#
# Table name: chair_specialties
#
#  id           :integer         not null, primary key
#  chair_id     :integer
#  specialty_id :integer
#  created_at   :datetime
#  updated_at   :datetime
#

