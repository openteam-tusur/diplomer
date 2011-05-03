YoungScientist::Application.routes.draw do

  devise_for :users#, :path => 'manage'

 # namespace :manage do
 #   resources :users
 #   resources :disciplines
 #   root :to => "application#index"
 # end

  resources :users
  resources :disciplines

  root :to => "application#index"
end

