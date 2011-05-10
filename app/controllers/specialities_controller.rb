# encoding: utf-8

class SpecialitiesController < CrudController
  actions :all, :except =>:show
end

