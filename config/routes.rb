Rails.application.routes.draw do
	devise_for :users
  resources :users,only: [:show,:edit,:update,:index]
  get 'users/:id/follows' => 'users#follows'
  get 'users/:id/followers' => 'users#followers'
  resources :relationships, only: [:create, :destroy]
  root 'home#top'
  get 'home/about'

  post '/search_result' => 'search#search'

  resources :books, only: [:index, :show, :edit, :create, :update, :destroy] do
    resource :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
end
