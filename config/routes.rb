Rails.application.routes.draw do
  resource :sessions, only: %i[new] do
    get 'auth', on: :member
  end
  resources :builds, only: %i[new create]
  resources :internal_builds, only: %i[index]
  resources :enqueues, only: %i[create]
  resources :devices, only: %i[index]
  resources :fetches, only: %i[create]
  resources :deploys, only: %i[destroy]
  root to: 'builds#index'
end
