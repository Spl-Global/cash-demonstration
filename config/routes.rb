# frozen_string_literal: true

Rails.application.routes.draw do
  resources :companies
  resources :cash_transactions, only: %i[create destroy]

  get 'profile', to: 'user_panel#profile', as: :profile
  get '/edit_profile', to: 'user_panel#edit_profile', as: :edit_profile
  devise_for :users,
             controllers: { sessions: 'users/sessions',
                            registrations: 'users/registrations',
                            passwords: 'users/passwords',
                            invitations: 'users/invitations' }
  resources :users, only: %i[edit update]

  authenticated :user, ->(user) { user.has_role? :teacher } do
    root 'user_panel#profile'
  end

  authenticated :user, ->(user) { user.has_role? :student } do
    root 'companies#index'
  end
  devise_scope :user do
    root to: 'users/sessions#new'
  end
end
