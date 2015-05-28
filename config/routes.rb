Rails.application.routes.draw do
  root 'welcome#index'

  devise_for :users
  namespace :admin do
    resources :schools
  end
end
