TusurDiplomer::Application.routes.draw do
  devise_for :users

  match 'diplomas/:id/pdf' => 'diplomas#pdf', :defaults => {:format => :pdf}, :as => 'pdf_diploma'
  match 'academic_records/:id/pdf' => 'academic_records#pdf', :defaults => {:format => :pdf}, :as => 'pdf_academic_record'

  match 'academic_records/:id/debug' => 'academic_records#debug'

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

  resources :academic_records do
    resources :courses
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

