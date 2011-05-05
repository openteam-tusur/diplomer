YoungScientist::Application.routes.draw do

  devise_for :users
  resources :users
  resources :disciplines, :except => :show
  resources :people
  resources :faculties, :except => :show
  resources :roles
  
  root :to => "application#index"
end

