# encoding: utf-8

class FacultiesController < CrudController
  actions :all, :except => :show
end
