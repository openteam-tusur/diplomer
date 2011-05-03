# encoding: utf-8

class ApplicationController < ActionController::Base

  protect_from_forgery

  #before_filter :find_current_contest

  layout 'application'

  def new
    1111
  end

  protected

    def layout_by_resource
      if devise_controller? && action_name == 'edit'
        "manage"
      else
        "application"
      end
    end

end

