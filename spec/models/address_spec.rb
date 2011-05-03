# encoding: utf-8

require 'spec_helper'

describe Address do
  describe "заполненность адреса" do
    before(:each) do
      @claim = Factory.create(:claim, :nomination => "schoolchild")
      @address = @claim.personal.address
    end

    it "если ничего не заполнено" do
      @address.filled?.should be false
    end

    it "если все заполнено" do
      @address.update_attributes(Factory(:address))
      @address.filled?.should be true
    end
  end

  describe "должен правильно строить полный адрес" do
    before(:each) do
      @claim = Factory.create(:claim, :nomination => "schoolchild")
    end

    it "если не указано строение и квартира" do
      @claim.personal.address.update_attributes(:postcode => "634050",
                                                :district => "tomsk",
                                                :settlement => "п. Тимирязево",
                                                :street => "ул. Первомайская",
                                                :house => "12")
      @claim.personal.address.full_address.should eql "634050, г. Томск, п. Тимирязево, ул. Первомайская, д. 12"
    end

    it "если указано строение и квартира" do
      @claim.personal.address.update_attributes(:postcode => "634050",
                                                :district => "tomsk",
                                                :settlement => "п. Тимирязево",
                                                :street => "ул. Первомайская",
                                                :house => "12",
                                                :building => "а",
                                                :flat => "2")
      @claim.personal.address.full_address.should eql "634050, г. Томск, п. Тимирязево, ул. Первомайская, д. 12/а, кв. 2"
    end

  end
end

# == Schema Information
#
# Table name: addresses
#
#  id           :integer         not null, primary key
#  street       :string(255)
#  house        :string(255)
#  building     :string(255)
#  flat         :string(255)
#  settlement   :string(255)
#  district     :string(255)
#  postcode     :string(255)
#  context_id   :integer
#  context_type :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

