class Faculty < ActiveRecord::Base
  has_one :role
  has_many :chairs
end

