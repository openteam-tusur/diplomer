# encoding: utf-8

class ApplicationController < ActionController::Base
  before_filter :authenticate_user!

  protect_from_forgery

  layout :layout_by_resource

  protected
    def layout_by_resource
      if user_signed_in?
        "manage"
      else
        "application"
      end
    end
end

