# encoding: utf-8

class RolesController < CrudController
  belongs_to :person

  actions :all, :except => [:index, :show]

  protected
    def build_resource
      @role = params[:type].classify.constantize.new(params[params[:type]])
      @role.person_id = parent.id
    end
end

