TusurDiplomer::Application.routes.draw do

  devise_for :users

  resources :diplomas
  resources :students
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

