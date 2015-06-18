Rails.application.routes.draw do
  root 'welcome#index'

  devise_for :users

  namespace :admin do
    resources :schools do
      resources :klasses
    end
    get 'users', to: 'users#index'
    post 'users/:id', to: 'users#update_role', as: 'update_user_role'

    scope 'classes/:klass_id' do
      resources :subjects
    end
  end
end
