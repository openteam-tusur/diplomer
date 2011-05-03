# encoding: utf-8
require 'spec_helper'

describe WorkPlace do

  describe "состояние заполненности" do

    before(:each) do
      @claim = Factory.create(:claim, :nomination => "technics")
    end

    it "после создания не заполнен" do
      @claim.work_place.filled?.should be false
    end

    it "для студента если все заполнено" do
      @claim.work_place.update_attributes(Factory(:work_place_student))
      @claim.work_place.filled?.should be true
    end

    describe "в зависимости от ученой степени" do
      it "если без степени" do
        @claim.work_place.update_attributes(Factory(:work_place_young_scientist))
        @claim.work_place.filled?.should be true
      end

      it "если есть ученая степень и не указаны ее дополнительные поля" do
        @claim.work_place.update_attributes(Factory(:work_place_young_scientist).merge(:academic_degree => "candidate"))
        @claim.work_place.filled?.should be false
      end

      it "если есть ученая степень и указано ее дополнительные поля" do
        @claim.work_place.update_attributes(Factory(:work_place_young_scientist).merge(:academic_degree => "candidate", :academic_degree_science => "технические", :academic_degree_on => Date.today))
        @claim.work_place.filled?.should be true
      end

    end
  end
end




# == Schema Information
#
# Table name: work_places
#
#  id                      :integer         not null, primary key
#  name                    :text
#  post                    :string(255)
#  academic_degree         :string(255)
#  academic_degree_science :string(255)
#  academic_degree_on      :date
#  academic_status         :string(255)
#  academic_status_on      :date
#  claim_id                :integer
#  created_at              :datetime
#  updated_at              :datetime
#  faculty                 :text
#  chief_lname             :string(255)
#  chief_mname             :string(255)
#  chief_fname             :string(255)
#  chief_post              :text
#  kind                    :string(255)
#  course                  :integer
#  phone_code              :string(255)
#  phone_number            :string(255)
#  chief_phone_number      :string(255)
#  chief_phone_code        :string(255)
#

