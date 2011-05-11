# encoding: utf-8

class DiplomasController < CrudController

  def create
    create!{
      redirect_to diploma_courses_path(resource) and return
    }
  end
end
