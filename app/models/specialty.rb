class Specialty < ActiveRecord::Base
  has_many :chair_specialty
  has_many :chair, :through => :chair_specialty
end



# == Schema Information
#
# Table name: specialties
#
#  id                     :integer         not null, primary key
#  code                   :string(255)
#  eng_code               :string(255)
#  title                  :text
#  eng_title              :text
#  start_recruitment_year :string(255)
#  end_recruitment_year   :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  qualification          :string(255)
#

