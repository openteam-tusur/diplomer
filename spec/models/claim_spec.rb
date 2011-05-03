# encoding: utf-8

require 'spec_helper'

describe Claim do
  describe "при создании" do
    before(:each) do
      @claim = Factory.create(:claim, :nomination => "schoolchild")
    end

    it "должен генерироваться 12-ти значный код" do
      @claim.code.size.should be 12
    end

    it "статус должен быть draft" do
      @claim.draft?.should be true
    end

    it "должен создавать personal" do
      @claim.personal.should_not be nil
    end

  end

  describe "при редактировании" do
    before(:each) do
      @claim = Factory.create(:claim, :nomination => "schoolchild")
    end

    it "если валидный код" do
      claim = @claim.contest.claims.new(:code => @claim.code)
      claim = claim.find_by_code
      claim.id.should eql @claim.id
    end

    it "если невалидный код" do
      claim = @claim.contest.claims.new(:code => "345dfj")
      claim = claim.find_by_code
      claim.id.should be nil
      claim.errors[:code].should eql ["Анкеты с таким кодом не найдено"]
    end

  end

  describe "юное дарование" do
    before(:each) do
      @claim = Factory.create(:claim, :nomination => "schoolchild")
    end

    it "при создании должен создавать школу"  do
      @claim.school.should_not be nil
    end

  end

  describe "молодой ученый" do
    before(:each) do
      @claim = Factory.create(:claim, :nomination => "natural_sciences")
    end

    it "при создании должен создавать место работы"  do
      @claim.work_place.should_not be nil
    end
  end

  describe "заполненность документов" do
    before(:each) do
      @claim = Factory.create(:claim, :nomination => "schoolchild")
    end

    it "после создания незаполнены" do
      @claim.documents_filled?.should be false
    end

    it "если поставили отсутствие документов, то считается заполнынным" do
      @claim.no_documents = true
      @claim.save
      @claim.documents_filled?.should be true
    end

    it "если есть хоть один документ, то считается заполнынным" do
      @claim.documents.build(:name => "документ").save!
      @claim.documents_filled?.should be true
    end
  end

  describe "заполненность научных руководителей" do
    before(:each) do
      @claim = Factory.create(:claim, :nomination => "schoolchild")
    end

    it "после создания незаполнены" do
      @claim.scientific_advisers_filled?.should be false
    end

    it "если хоть один заполнен" do
      @claim.scientific_advisers.create!(Factory(:scientific_adviser))
      @claim.scientific_advisers_filled?.should be true
    end
  end

  describe "заполненность родителей" do
    before(:each) do
      @claim = Factory.create(:claim, :nomination => "schoolchild")
    end

    it "после создания незаполнены" do
      @claim.parents_filled?.should be false
    end

    it "если хоть один заполнен" do
      @claim.parents.create!(Factory(:parent))
      @claim.parents_filled?.should be true
    end
  end

  describe "заполненность анкеты юного дарования" do
    before(:each) do
      @claim = Factory.create(:claim, :nomination => "schoolchild")
    end

    it "если ничего не заполнено" do
      @claim.filled?.should be false
    end

    it "если все заполнено" do
      @claim.personal.update_attributes(Factory(:personal))
      @claim.school.update_attributes(Factory(:school))
      @claim.documents.create!(:name => "документ")
      @claim.scientific_advisers.create!(Factory(:scientific_adviser))
      @claim.parents.create!(Factory(:parent))
      @claim.filled?.should be true
    end
  end

  describe "заполненность анкеты молодого ученого" do
    before(:each) do
      @claim = Factory.create(:claim, :nomination => "technics")
    end

    it "если ничего не заполнено" do
      @claim.filled?.should be false
    end

    it "если все заполнено" do
      @claim.personal.update_attributes(Factory(:personal))
      @claim.work_place.update_attributes(Factory(:work_place_student))
      @claim.documents.create!(:name => "документ")
      @claim.scientific_advisers.create!(Factory(:scientific_adviser))
      @claim.filled?.should be true
    end
  end


end



# == Schema Information
#
# Table name: claims
#
#  id           :integer         not null, primary key
#  code         :string(255)
#  state        :string(255)
#  nomination   :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  no_documents :boolean
#  contest_id   :integer
#

