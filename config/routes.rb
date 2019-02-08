Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }

  root to: 'welcome#index'
  get '/jobs', to: 'jobs#index'
  post 'apply', to: 'jobs#apply'
  resources :applicants, only: [:show, :new, :create]
  resources :employers, only: [:show, :new, :create] do
    resources :jobs
  end
end
