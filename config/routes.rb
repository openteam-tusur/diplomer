YoungScientist::Application.routes.draw do

  devise_for :users
  resources :users
  resources :disciplines, :except => :show
  resources :people
  
  root :to => "application#index"
end

