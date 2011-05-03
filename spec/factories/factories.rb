# encoding: utf-8

Factory.define :address, :default_strategy => :attributes_for do | address |
  address.postcode "634050"
  address.district "tomsk"
  address.settlement "Томск"
  address.street "Ленина"
  address.house "40"
  address.flat "206"
end

Factory.define :claim, :default_strategy => :attributes_for do | claim |
  claim.nomination "schoolchild"
  claim.association :contest
end

Factory.define :contest, :default_strategy => :attributes_for do | contest |
  contest.year 2011
  contest.start_date '2011-03-01'
  contest.finish_date '2011-10-01'
end

Factory.define :parent, :default_strategy => :attributes_for do | parent |
  parent.fname       "Василий"
  parent.mname       "Иванович"
  parent.lname       "Петров"
  parent.phone_code  "3822"
  parent.phone_number  "701557"
end

Factory.define :personal, :default_strategy => :attributes_for do | personal |
  personal.fname       "Василий"
  personal.mname       "Иванович"
  personal.lname       "Петров"
  personal.birthdate   Date.today - 15.years
  personal.inn         "12345678"
  personal.pss         "123456"
  personal.email       "demo@demo.de"
  personal.address_attributes    Factory(:address)
  personal.phone_code  "3822"
  personal.phone_number  "701557"
  personal.doc_type    "паспорт"
  personal.doc_series  "3123"
  personal.doc_number  "321654"
  personal.doc_give_by "ОВД Какого-то района Томской области"
  personal.doc_give_on Date.today
  personal.accept_terms true
end

Factory.define :school, :default_strategy => :attributes_for do | school |
  school.name "Школа № 18"
  school.address_attributes    Factory(:address)
  school.year "2"
  school.chief_lname "Емануил"
  school.chief_mname "Павлик"
  school.chief_fname "Кандратьевич"
  school.chief_post "Слесарь высшего разряда"
  school.chief_phone_code "3822"
  school.chief_phone_number "701-557"
end

Factory.define :scientific_adviser, :default_strategy => :attributes_for do | scientific_adviser |
  scientific_adviser.lname  "Шурыгин"
  scientific_adviser.fname  "Юрий"
  scientific_adviser.mname  "Алексеевич"
  scientific_adviser.job   "ТУСУР"
  scientific_adviser.post   "Ректор"
  scientific_adviser.phone_code  "3822"
  scientific_adviser.phone_number  "701557"
  scientific_adviser.address_attributes    Factory(:address)
end

Factory.define :work_place_student, :default_strategy => :attributes_for, :class => WorkPlace do | work_place |
  work_place.kind         "student"
  work_place.name         "Тусур"
  work_place.address_attributes Factory(:address)
  work_place.faculty      "ФСУ"
  work_place.course       1
  work_place.chief_lname  "Шурыгин"
  work_place.chief_fname  "Юрий"
  work_place.chief_mname  "Алексеевич"
  work_place.chief_post   "Ректор"
  work_place.chief_phone_code  "3822"
  work_place.chief_phone_number  "701557"
end

Factory.define :work_place_young_scientist, :default_strategy => :attributes_for, :class => WorkPlace do | work_place |
  work_place.kind         "young_scientist"
  work_place.name         "Тусур"
  work_place.address_attributes Factory(:address)
  work_place.post         "инженер"
  work_place.phone_code         "3822"
  work_place.phone_number         "701557"
  work_place.academic_degree  "none"
  work_place.chief_lname    "Шурыгин"
  work_place.chief_fname    "Юрий"
  work_place.chief_mname    "Алексеевич"
  work_place.chief_post     "Ректор"
  work_place.chief_phone_code    "3822"
  work_place.chief_phone_number    "701557"
end

