# encoding: utf-8

class CoursesController < CrudController
  belongs_to :diploma
  actions :all, :except => :show
end
