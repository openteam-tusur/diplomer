class Diploma < ActiveRecord::Base
  has_one :student
end

# == Schema Information
#
# Table name: diplomas
#
#  id              :integer         not null, primary key
#  specialty_id    :integer
#  number          :string(255)
#  admission_date  :date
#  graduation_date :date
#  study_form      :string(255)
#  study_duration  :string(255)
#  total_hours     :integer
#  contact_hours   :integer
#  created_at      :datetime
#  updated_at      :datetime
#

