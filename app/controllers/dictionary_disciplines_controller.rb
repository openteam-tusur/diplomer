# encoding: utf-8

class DictionaryDisciplinesController < CrudController
  actions :all, :except =>:show
end

