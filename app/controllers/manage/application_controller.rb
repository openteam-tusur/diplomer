class Manage::ApplicationController < ApplicationController
  before_filter :authenticate_user!
  layout 'manage'

  def index
  end
end

