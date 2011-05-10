class ProgrammItem < ActiveRecord::Base
  belongs_to :diploma
end


# == Schema Information
#
# Table name: programm_items
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  eng_name   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

