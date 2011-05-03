YoungScientist::Application.routes.draw do

  devise_for :users, :path => 'manage'

  namespace :manage do
    resources :users
    resources :dictionaries
    root :to => "application#index"
  end

  root :to => "application#new"

end

