class Chair < ActiveRecord::Base
  belongs_to  :faculty
  has_one     :role
  has_many    :chair_specialty
  has_many    :specialty, :through => :chair_specialty
end


# == Schema Information
#
# Table name: chairs
#
#  id         :integer         not null, primary key
#  title      :text
#  abbr       :string(255)
#  eng_title  :text
#  eng_abbr   :string(255)
#  faculty_id :integer
#  created_at :datetime
#  updated_at :datetime
#

