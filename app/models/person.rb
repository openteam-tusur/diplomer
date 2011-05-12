# encoding: utf-8

class Person < ActiveRecord::Base
  has_one   :user, :dependent => :destroy
  has_many  :roles

  delegate :email, :to => :user, :allow_nil => true

  accepts_nested_attributes_for :user

  validates_presence_of :firstname, :surname, :patrynomic

  def name
    "#{surname} #{firstname} #{patrynomic}"
  end
end


# == Schema Information
#
# Table name: people
#
#  id         :integer         not null, primary key
#  surname    :string(255)
#  firstname  :string(255)
#  patrynomic :string(255)
#  created_at :datetime
#  updated_at :datetime
#

