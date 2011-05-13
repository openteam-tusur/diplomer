# encoding: utf-8

Factory.define :course, :default_strategy => :attributes_for do |course|
  course.credits   '140'
  course.hours     '500'
  course.grade     'excellent'
end
