Rails.application.routes.draw do

  root 'welcome#index'

  get 'home', to: 'home#index', as: 'home'

  devise_for :users

  namespace :admin do
    get '/', to: 'dashboards#index', as: 'dashboard'

    resources :schools do
      resources :klasses
    end

    get 'users', to: 'users#index'
    post 'users/:id', to: 'users#update_role', as: 'update_user_role'

    scope 'classes/:klass_id' do
      resources :subjects
    end
  end

  get 'records', to: 'records#index', as: 'records'

  scope :registrations do
    get '/', to: 'registrations#index', as: 'registrations'
    get 'school/:id', to: 'registrations#school', as: 'registrations_school'
    get 'class/:id', to: 'registrations#klass', as: 'registrations_klass'
    post 'class/:id/authenticate', to: 'registrations#authenticate', as: 'registrations_authenticate'
  end
end
