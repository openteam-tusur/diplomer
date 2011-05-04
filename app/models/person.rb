class Person < ActiveRecord::Base
  has_one   :user,
            :dependent => :destroy
 
  has_many  :roles
  
  accepts_nested_attributes_for :user

end  
