# encoding: utf-8

class ChairsController < CrudController
  actions :all, :except =>:show
end

