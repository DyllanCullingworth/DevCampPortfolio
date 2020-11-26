Rails.application.routes.draw do

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }

  # == Pages
  root to: 'pages#home'
  get 'home', to: 'pages#home'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  # ==

  # == Blogs
  resources :blogs do
    member do
      get :toggle_status
    end
  end

  # ==

  # == Portfolios
  resources :portfolios, except: [:show]
  get 'portfolio/:id', to: 'portfolios#show', as: 'show_portfolio'
  get 'angular', to: 'portfolios#angular'
  # ==
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
