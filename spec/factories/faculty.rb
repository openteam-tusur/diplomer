# encoding: utf-8

Factory.define :faculty, :default_strategy => :attributes_for do |faculty|
  faculty.abbr 'ФСУ'
  faculty.eng_abbr 'FSU'
  faculty.title 'Факультет Систем Управления'
  faculty.eng_title 'Faculty of Manage System'
end
