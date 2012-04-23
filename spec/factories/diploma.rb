# encoding: utf-8

Factory.define :diploma, :default_strategy => :attributes_for do |diploma|
  diploma.admission_date  '01-09-2003'
  diploma.graduation_date '31-05-2009'
  diploma.contact_hours   '7453'
  diploma.total_hours     '3652'
  diploma.study_duration  '6'
  diploma.study_form      'fulltime'
  diploma.speciality_term 'Программное обеспечение вычислительной техники и автоматизированных систем'
  diploma.association     :speciality
  diploma.association     :chair
end
