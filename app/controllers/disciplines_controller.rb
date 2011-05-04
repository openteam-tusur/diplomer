class DisciplinesController < CrudController
  actions :all, :except =>:show
end

