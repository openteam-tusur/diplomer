# encoding: utf-8

require 'spec_helper'

describe Chair do
  it 'метод :translated? должен возвращать true если есть пустые поля с префиксом eng_' do
    chair = Factory.create(:chair, :eng_abbr => nil)
    chair.translated?.should be false
  end

  it 'метод :translated? должен возвращать true если нет пустых полей с префиксом eng_' do
    chair = Factory.create(:chair)
    chair.translated?.should be true
  end
end


# == Schema Information
#
# Table name: chairs
#
#  id         :integer         not null, primary key
#  title      :text
#  abbr       :string(255)
#  eng_title  :text
#  eng_abbr   :string(255)
#  faculty_id :integer
#  created_at :datetime
#  updated_at :datetime
#

