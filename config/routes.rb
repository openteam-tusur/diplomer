TusurDiplomer::Application.routes.draw do

  devise_for :users
  resources :users
  resources :disciplines, :except => :show
  resources :faculties, :except => :show
  resources :people do
    resources :roles, :except => [:index,:show]
  end
  resources :chairs
  resources :specialties, :except => :show

  root :to => "application#index"
end

