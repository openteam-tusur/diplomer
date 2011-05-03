# encoding: utf-8
require 'spec_helper'

describe Personal do

  describe "состояние заполненности" do
    before(:each) do
      @claim = Factory.create(:claim, :nomination => "schoolchild")
    end

    it "после создания не заполнен" do
      @claim.personal.filled?.should be false
    end

    it "если хотя бы одно поле не заполнено" do
      attributes = Factory(:personal)
      attributes.delete(:doc_give_on)
      @claim.personal.update_attributes(attributes)
      @claim.personal.filled?.should be false
    end

    it "если все заполнено и дано согласия на обработку персональных данных" do
      @claim.personal.update_attributes(Factory(:personal))
      @claim.personal.filled?.should be true
      @claim.personal.errors.empty?.should be true
    end

    it "если все заполнено и нет согласия на обработку персональных данных" do
      @claim.personal.update_attributes(Factory(:personal).merge(:accept_terms => false))
      @claim.personal.filled?.should be false
    end

    it "должна показываться ошибка если возраст больше 33 лет" do
      @claim.personal.update_attributes(Factory(:personal).merge(:birthdate => Date.today - 33.year))
      @claim.personal.filled?.should be false
      @claim.personal.errors[:birthdate].should eql ["Возраст соискателей не должен превышать тридцати трех лет на дату выдвижения"]
    end
  end

end





# == Schema Information
#
# Table name: personals
#
#  id                         :integer         not null, primary key
#  fname                      :string(255)
#  mname                      :string(255)
#  lname                      :string(255)
#  birthdate                  :date
#  inn                        :string(255)
#  pss                        :string(255)
#  email                      :string(255)
#  doc_type                   :string(255)
#  doc_series                 :string(255)
#  doc_number                 :string(255)
#  doc_give_by                :text
#  doc_give_on                :date
#  claim_id                   :integer
#  created_at                 :datetime
#  updated_at                 :datetime
#  photo_file_name            :string(255)
#  photo_content_type         :string(255)
#  photo_file_size            :integer
#  photo_updated_at           :datetime
#  photo_original_dimensions  :string(255)
#  photo_thumbnail_dimensions :string(255)
#  accept_terms               :boolean
#  phone_code                 :string(255)
#  phone_number               :string(255)
#

