class ChairSpeciality < ActiveRecord::Base
  belongs_to :chair
  belongs_to :speciality
end



# == Schema Information
#
# Table name: chair_specialities
#
#  id            :integer         not null, primary key
#  chair_id      :integer
#  speciality_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#

