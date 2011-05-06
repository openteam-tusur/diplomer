class ChairsController < CrudController
  actions :all, :except =>:show
end

