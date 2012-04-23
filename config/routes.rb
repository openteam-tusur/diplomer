TusurDiplomer::Application.routes.draw do
  devise_for :users

  match 'diplomas/:id/pdf' => 'diplomas#pdf', :defaults => {:format => :pdf}, :as => 'pdf_diploma'

  resources :diplomas do
    resources :student
    resources :courses
    resources :papers
    resources :practices
    resources  :final_state_examinations

    resource  :final_qualification_project

    resources :programm_items, :only => [] do
      post :sort, :on => :collection
    end
  end

  resources :chairs
  resources :disciplines,  :except => :show
  resources :faculties,    :except => :show

  resources :specialities do
    resources :courses
    resources :papers
    resources :practices
    resources  :final_state_examinations
    resources :programm_items, :only => [] do
      post :sort, :on => :collection
    end
  end

  resources :suggestions,  :only => :index
  resources :users

  resources :people do
    resources :roles, :except => [:index,:show]
  end

  root :to => "application#index"
end

