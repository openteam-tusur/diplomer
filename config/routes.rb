TusurDiplomer::Application.routes.draw do

  devise_for :users
  resources :diplomas do
    resources :student
    resources :courses
    resources :papers
    resources :practices
    resource  :final_state_examination
    resource  :final_qualification_project
  end

  resources :users
  resources :dictionary_disciplines, :except => :show
  resources :faculties, :except => :show
  resources :people do
    resources :roles, :except => [:index,:show]
  end
  resources :chairs
  resources :specialities, :except => :show

  root :to => "application#index"
end

