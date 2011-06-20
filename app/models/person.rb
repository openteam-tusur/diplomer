# encoding: utf-8

class Person < ActiveRecord::Base
  has_many :roles

  has_one :user, :dependent => :destroy

  validates_presence_of :firstname, :surname, :patrynomic

  accepts_nested_attributes_for :user

  delegate :email, :to => :user, :allow_nil => true

  default_scope :order => 'surname ASC'

  def name
    "#{surname} #{firstname} #{patrynomic}"
  end

  alias :to_s :name
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

