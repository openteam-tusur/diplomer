YoungScientist::Application.routes.draw do

  devise_for :users
  resources :users
  resources :disciplines, :except => :show
  resources :faculties, :except => :show
  resources :people do
    resources :roles, :except => [:index,:show]
  end
  
  root :to => "application#index"
end

