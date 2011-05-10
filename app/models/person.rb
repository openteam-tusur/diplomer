# encoding: utf-8
class Person < ActiveRecord::Base
  has_one   :user,
            :dependent => :destroy
 
  has_many  :roles
  
  delegate :email, :to => :user, :allow_nil => true
  
  accepts_nested_attributes_for :user
  
  def name
    "#{lname} #{fname} #{mname}"
  end

  def eng_name
    "#{eng_lname} #{eng_fname} #{eng_mname}"
  end
end  

# == Schema Information
#
# Table name: people
#
#  id         :integer         not null, primary key
#  lname      :string(255)
#  fname      :string(255)
#  mname      :string(255)
#  eng_lname  :string(255)
#  eng_fname  :string(255)
#  eng_mname  :string(255)
#  created_at :datetime
#  updated_at :datetime
#

