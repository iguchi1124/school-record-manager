Rails.application.routes.draw do
  root 'welcome#index'

  devise_for :users
  namespace :admin do
    resources :schools do
      resources :klasses
    end
  end
end
