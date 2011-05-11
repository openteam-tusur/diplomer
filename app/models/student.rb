# encoding: utf-8

class Student < ActiveRecord::Base
  belongs_to :diploma

  def to_s
    "#{surname} #{firstname}"
  end
end


# == Schema Information
#
# Table name: students
#
#  id             :integer         not null, primary key
#  surname        :string(255)
#  firstname      :string(255)
#  patrynomic     :string(255)
#  birthday       :date
#  code           :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#  diploma_id     :integer
#  eng_surname    :string(255)
#  eng_firstname  :string(255)
#  eng_patrynomic :string(255)
#

