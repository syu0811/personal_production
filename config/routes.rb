Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  devise_scope :user do
    get "user/:id", to: "users/registrations#detail"
    get "signup", to: "users/registrations#new"
    get "login", to: "users/sessions#new"
    get "logout", to: "users/sessions#destroy"
  end
  resources :admin, only: [:index]
  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update, :destroy]
    resources :job, only: [:index, :show, :new, :create, :edit, :update, :destroy]
    resources :group, only: [:index, :show, :new, :create, :edit, :update, :destroy]
    resources :student, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  end
  resources :users, only: [:show, :edit, :update]
  resources :tops, only: [:index, :show]
  root 'tops#index'
end
