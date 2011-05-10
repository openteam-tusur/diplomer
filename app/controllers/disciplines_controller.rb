# encoding: utf-8

class DisciplinesController < CrudController
  actions :all, :except =>:show
end

