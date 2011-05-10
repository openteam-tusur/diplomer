TusurDiplomer::Application.routes.draw do

  resources :diplomas

  resources :students

  devise_for :users
  resources :users
  resources :disciplines, :except => :show
  resources :faculties, :except => :show
  resources :people do
    resources :roles, :except => [:index,:show]
  end
  resources :chairs
  resources :specialities, :except => :show

  root :to => "application#index"
end

