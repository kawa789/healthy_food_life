Rails.application.routes.draw do
  devise_for :views
  devise_for :users
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  resources :foods do
    resources :food_comments, only: [:create, :destroy]
  end

  resources :users
end
