# encoding: utf-8

class FacultiesController < CrudController
  actions :all, :except => :show

  def index
    index! {
      @facets = Faculty.search.facet(:translated).rows
    }
  end
end
