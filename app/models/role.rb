class Role < ActiveRecord::Base
  belongs_to :person
  belongs_to :faculty
  
  scope :type, lambda { |type|
      where :type => type.to_s.classify
  }

end
