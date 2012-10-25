# encoding: utf-8

class ChairChief < Role
end

# == Schema Information
#
# Table name: roles
#
#  id         :integer          not null, primary key
#  type       :string(255)
#  person_id  :integer
#  created_at :datetime
#  updated_at :datetime
#  faculty_id :integer
#  chair_id   :integer
#

