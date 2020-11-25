Rails.application.routes.draw do
  # ================= Pages
  root to: 'pages#home'
  get 'home', to: 'pages#home'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  # =================

  # ================= Blogs
  resources :blogs
  # =================

  # ================= Portfolios
  resources :portfolios, except: [:show]
  get 'portfolio/:id', to: 'portfolios#show', as: 'show_portfolio'
  # =================
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
