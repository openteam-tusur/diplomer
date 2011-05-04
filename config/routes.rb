YoungScientist::Application.routes.draw do

  devise_for :users
  resources :users
  resources :disciplines, :except => :show

  root :to => "application#index"
end

