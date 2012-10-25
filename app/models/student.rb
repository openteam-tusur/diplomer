# encoding: utf-8

class Student < ActiveRecord::Base
  belongs_to :studentable, :polymorphic => true

  validates_presence_of :surname, :firstname, :birthday

  has_translate

  def to_s
    "#{surname} #{firstname}"
  end

  def full_info
    filled_attributes.join(' ') << ", дата рождения: #{I18n.l birthday}"
  end

  private

  def filled_attributes
    [surname, firstname, patrynomic].select { |attribute| attribute.present? }
  end
end

# == Schema Information
#
# Table name: students
#
#  id               :integer          not null, primary key
#  surname          :string(255)
#  firstname        :string(255)
#  patrynomic       :string(255)
#  birthday         :date
#  code             :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#  studentable_id   :integer
#  eng_surname      :string(255)
#  eng_firstname    :string(255)
#  eng_patrynomic   :string(255)
#  studentable_type :string(255)
#

