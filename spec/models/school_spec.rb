# encoding: utf-8
require 'spec_helper'

describe School do
  describe "состояние заполненности" do
    before(:each) do
      @claim = Factory.create(:claim, :nomination => "schoolchild")
    end

    it "после создания не заполнен" do
      @claim.school.filled?.should be false
    end

    it "если хотя бы одно поле не заполнено" do
      attributes = Factory(:school)
      attributes.delete(:name)
      @claim.school.update_attributes(attributes)
      @claim.school.filled?.should be false
    end

    it "если все заполнено" do
      @claim.school.update_attributes(Factory(:school))
      @claim.school.filled?.should be true
    end
  end
end



# == Schema Information
#
# Table name: schools
#
#  id                 :integer         not null, primary key
#  name               :text
#  year               :string(255)
#  chief_lname        :string(255)
#  chief_mname        :string(255)
#  chief_fname        :string(255)
#  chief_post         :text
#  claim_id           :integer
#  created_at         :datetime
#  updated_at         :datetime
#  chief_phone_number :string(255)
#  chief_phone_code   :string(255)
#

