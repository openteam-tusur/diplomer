class Manage::UsersController < Manage::CrudController
  before_filter :check_admin
  actions :all, :except => :show

  private
    def check_admin
      redirect_to root_path and return unless current_user.role_admin?
    end
end

