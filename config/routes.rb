Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'towns/top' => 'towns#top'
  get 'towns/index' => 'towns#index'
  root 'towns#index'
  get 'towns/facility' => 'towns#facility'
  get 'towns/event' => 'towns#event'
  get 'towns/food' => 'towns#food'
  get 'towns/fukufuku' => 'towns#fukufuku'
  get 'towns/new' => 'towns#new'
  post 'towns' => 'towns#create'
  get 'towns/:id' => 'towns#show',as: 'town'
  patch 'towns/:id' => 'towns#update'
  delete 'towns/:id' => 'towns#destroy'
  get 'towns/:id/edit' => 'towns#edit', as:'edit_town'
  get 'towns/:town_id/likes' => 'likes#create'
  get 'towns/:town_id/likes/:id' => 'likes#destroy'
  resources :towns

  resources :towns do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end
end
