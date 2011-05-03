# encoding: utf-8
require File.dirname(__FILE__) + '/../spec_helper'

describe "pdf отчет анкеты" do

  it "место учебы студента" do
    claim = Factory.create(:claim, :nomination => "technics")
    claim.personal.update_attributes(Factory(:personal))
    claim.work_place.update_attributes(Factory(:work_place_student))
    work_place = claim.work_place
    document = Nokogiri::XML::Document.parse(claim.to_report)
    document.css('claim work_place name').text.should eql work_place.name
    document.css('claim work_place address').text.should eql work_place.address.full_address
    document.css('claim work_place faculty').text.should eql work_place.faculty
    document.css('claim work_place course').text.should eql work_place.course.to_s
    document.css('claim work_place chief').text.should eql "#{work_place.chief_lname} #{work_place.chief_fname} #{work_place.chief_mname}"
    document.css('claim work_place chief_post').text.should eql work_place.chief_post
    document.css('claim work_place chief_phone').text.should eql "(#{work_place.chief_phone_code}) #{work_place.chief_phone_number}"
  end

  describe "место работы молодого ученого" do
    before(:each) do
      @claim = Factory.create(:claim, :nomination => "technics")
      @claim.personal.update_attributes(Factory(:personal))
      @claim.work_place.update_attributes(Factory(:work_place_young_scientist))
      @work_place = @claim.work_place
      @document = Nokogiri::XML::Document.parse(@claim.to_report)
    end
    it "номер номинации" do
      @document.css('claim nomination_number').text.should eql "3"
    end
    it "общая информация" do
      @document.css('claim work_place name').text.should eql @work_place.name
      @document.css('claim work_place post').text.should eql @work_place.post
      @document.css('claim work_place address').text.should eql @work_place.address.full_address
      @document.css('claim work_place phone').text.should eql "(#{@work_place.phone_code}) #{@work_place.phone_number}"
      @document.css('claim work_place chief').text.should eql "#{@work_place.chief_lname} #{@work_place.chief_fname} #{@work_place.chief_mname}"
      @document.css('claim work_place chief_post').text.should eql @work_place.chief_post
      @document.css('claim work_place chief_phone').text.should eql "(#{@work_place.chief_phone_code}) #{@work_place.chief_phone_number}"
    end
    it "без ученой степени" do
      @document.css('claim degree_status').text.should eql @work_place.academic_degree
    end
    it "с ученой степени" do
      @work_place.update_attributes(:academic_degree => :candidate,
                                    :academic_degree_science => "технические науки",
                                    :academic_degree_on => "10.10.2006",
                                    :academic_status => "доцент",
                                    :academic_status_on => "15.10.2007")
      @document = Nokogiri::XML::Document.parse(@claim.reload.to_report)
      @document.css('claim degree_status').text.should eql @work_place.academic_degree
      @document.css('claim academic degree').text.should eql @work_place.human_academic_degree
      @document.css('claim academic degree_on').text.should eql I18n.l(@work_place.academic_degree_on)
      @document.css('claim academic science').text.should eql @work_place.academic_degree_science
      @document.css('claim academic status').text.should eql @work_place.academic_status
      @document.css('claim academic status_on').text.should eql I18n.l(@work_place.academic_status_on)
    end
  end

  describe "юное дарование" do
    before(:each) do
      @claim = Factory.create(:claim, :nomination => "schoolchild")
      @claim.personal.update_attributes(Factory(:personal))
      @claim.school.update_attributes(Factory(:school))
      @claim.documents.build(:name => "дневник").save!
      @claim.documents.build(:name => "отчет").save!
      @claim.scientific_advisers.create!(Factory(:scientific_adviser))
      @claim.parents.create!(Factory(:parent))
      @document = Nokogiri::XML::Document.parse(@claim.to_report)
    end

    it "год конкурса" do
      @document.css('claim > year').text.should eql @claim.contest.year.to_s
    end

    it "номер номинации" do
      @document.css('claim nomination_number').text.should eql "1"
    end

    it "дата" do
      @document.css('claim date').text.should eql I18n.l(Date.today)
    end

    it "персональная информация" do
      @document.css('claim full_name').text.should eql "#{@claim.personal.lname} #{@claim.personal.fname} #{@claim.personal.mname}"
      @document.css('claim first_name').text.should eql @claim.personal.fname
      @document.css('claim last_name').text.should eql @claim.personal.lname
      @document.css('claim middle_name').text.should eql @claim.personal.mname
      @document.css('claim birthdate').text.should eql I18n.l(@claim.personal.birthdate)
      @document.css('claim personal_address').text.should eql @claim.personal.address.full_address
      @document.css('claim personal_phone').text.should eql "(#{@claim.personal.phone_code}) #{@claim.personal.phone_number}"
      @document.css('claim personal_document type').text.should eql @claim.personal.doc_type
      @document.css('claim personal_document series').text.should eql @claim.personal.doc_series
      @document.css('claim personal_document number').text.should eql @claim.personal.doc_number
      @document.css('claim personal_document give_by').text.should eql @claim.personal.doc_give_by
      @document.css('claim personal_document give_on').text.should eql I18n.l(@claim.personal.doc_give_on)
      @document.css('claim personal_inn').text.should eql @claim.personal.inn
      @document.css('claim personal_pss').text.should eql @claim.personal.pss
    end

    it "адрес электронной почты" do
      @claim.personal.email?.should be true
      @document.css('claim personal_email').text.should eql @claim.personal.email
      @claim.personal.update_attribute(:email, "")
      @document = Nokogiri::XML::Document.parse(@claim.to_report)
      @document.css('claim personal_email').text.should eql "не указан"
    end

    it "место учебы юного дарования" do
      @document.css('claim schoole name').text.should eql @claim.school.name
      @document.css('claim schoole address').text.should eql @claim.school.address.full_address
      @document.css('claim schoole chief').text.should eql @claim.school.chief_full_name
      @document.css('claim schoole chief_phone').text.should eql "(#{@claim.school.chief_phone_code}) #{@claim.school.chief_phone_number}"
      @document.css('claim > schoole > year').text.should eql @claim.school.year
    end

    it "научные руководители" do
      scientific_adviser = @claim.scientific_advisers.first
      @document.css("claim scientific_advisers scientific_adviser").size.should be 1
      @document.css("claim scientific_advisers scientific_adviser name").first.text.should eql scientific_adviser.name
      @document.css("claim scientific_advisers scientific_adviser job").first.text.should eql scientific_adviser.job
      @document.css("claim scientific_advisers scientific_adviser post").first.text.should eql scientific_adviser.post
      @document.css("claim scientific_advisers scientific_adviser address").first.text.should eql scientific_adviser.address.full_address
      @document.css("claim scientific_advisers scientific_adviser phone").first.text.should eql "(#{scientific_adviser.phone_code}) #{scientific_adviser.phone_number}"
    end

    it "родители" do
      parent = @claim.parents.first
      @document.css("claim parents person").size.should be 1
      @document.css("claim parents person name").first.text.should eql parent.name
    end

    describe "перечень документов" do
      it "если нет документов" do
        @claim.update_attribute(:no_documents, true)
        @document = Nokogiri::XML::Document.parse(@claim.to_report)
        @document.css("claim no_documents").text.should eql "нет"
        @document.css("claim documents").empty?.should be true
      end
      it "если есть документы" do
        @document.css("claim no_documents").text.should eql "да"
        @document.css("claim documents document").size.should be 2
        @document.css("claim documents document name").first.text.should eql "дневник"
        @document.css("claim documents document name").last.text.should eql "отчет"
      end
    end
  end
end

