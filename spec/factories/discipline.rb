# encoding: utf-8

Factory.define :discipline, :default_strategy => :attributes_for do |discipline|
  discipline.title 'Дисциплина'
  discipline.eng_title 'Discipline'
end
