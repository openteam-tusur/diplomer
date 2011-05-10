# encoding: utf-8

class Dictionary < ActiveRecord::Base
end

# == Schema Information
#
# Table name: dictionaries
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  eng_title  :string(255)
#  created_at :datetime
#  updated_at :datetime
#  type       :string(255)
#

