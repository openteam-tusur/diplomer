TusurDiplomer::Application.routes.draw do
  devise_for :users

  match 'diplomas/:id/pdf' => 'diplomas#pdf', :defaults => {:format => :pdf}, :as => 'pdf_diploma'

  resources :diplomas do
    resources :student
    resources :courses
    resources :papers
    resources :practices
    resource  :final_state_examination
    resource  :final_qualification_project
    resources :programm_items do
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
    resource  :final_state_examination
  end

  resources :suggestions,  :only => :index
  resources :users

  resources :people do
    resources :roles, :except => [:index,:show]
  end

  root :to => "application#index"
end

