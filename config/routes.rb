Rails.application.routes.draw do
  resources :organizations
  get 'accounts/switch'
  resources :video_ratings
  resources :videos
  get 'about/terms'
  get 'about/privacy'
  devise_for :users
  root to: "home#index"
  get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
