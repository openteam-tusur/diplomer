class Person < ActiveRecord::Base
  has_one   :user,
            :dependent => :destroy
 
  has_many  :roles
  
  accepts_nested_attributes_for :user
  
  def name
    "#{lname} #{fname} #{mname}"
  end

  def eng_name
    "#{eng_lname} #{eng_fname} #{eng_mname}"
  end
end  
