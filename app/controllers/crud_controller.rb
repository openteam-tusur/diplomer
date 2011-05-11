# encoding: utf-8

class CrudController < ApplicationController
  has_searcher

  inherit_resources

  render_inheritable

  helper_method :render_new_button?

  protected
    def collection
        get_collection_ivar || set_collection_ivar(search_and_paginate_collection)
    end

    def search_and_paginate_collection
        if params[:utf8]
          searcher.pagination = paginate_options
          searcher.results
        else
          end_of_association_chain.paginate(paginate_options)
        end
    end

    def paginate_options(options={})
      {
        :page       => params[:page],
        :per_page   => per_page
      }.merge(options)
    end

    def per_page
      10
    end

    def render_new_button?
      respond_to? :new
    end
end

