# encoding: utf-8

class StudentsController < CrudController
  belongs_to :diploma, :singleton => true
end
