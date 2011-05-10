# encoding: utf-8
class Role < ActiveRecord::Base
  belongs_to :person
  belongs_to :faculty
  belongs_to :chair

  scope :type, lambda { |type|
      where :type => type.to_s.classify
  }

  def to_s
    self.class.model_name.human
  end

end


# == Schema Information
#
# Table name: roles
#
#  id         :integer         not null, primary key
#  type       :string(255)
#  person_id  :integer
#  created_at :datetime
#  updated_at :datetime
#  faculty_id :integer
#  chair_id   :integer
#

