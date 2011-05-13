# encoding: utf-8

Factory.define :chair, :default_strategy => :attributes_for do |chair|
  chair.abbr 'АОИ'
  chair.eng_abbr 'AOI'
  chair.title 'Кафедра Автоматизации Обработки Информации'
  chair.eng_title 'Chair of ROCK'
  chair.association :faculty
end
