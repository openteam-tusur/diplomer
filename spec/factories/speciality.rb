# encoding: utf-8

Factory.define :speciality, :default_strategy => :attributes_for do |speciality|
  speciality.code                   '230105'
  speciality.title                  'Программное обеспечение вычислительной техники и автоматизированных систем'
  speciality.eng_title              'Program software'
  speciality.qualification          'инженер'
  speciality.eng_qualification      'engeneer'
end

