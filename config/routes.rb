Rails.application.routes.draw do
  devise_for :users

  get '/', to: 'jobs#index'
  resources :applicants, only: ['show']
end
