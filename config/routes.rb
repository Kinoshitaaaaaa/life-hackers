Rails.application.routes.draw do

 devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

 devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

namespace :admin do
  get "/" => "homes#top"
  resources :genres, only: [:index, :edit, :create, :update]
  get "/search" => "posts#search"
  get "/users/unsubscribe" => "users#unsubscribe"
  patch "/users/is_deleted" => "users#is_deleted"
  resources :posts, only: [:index, :create, :new, :show, :edit, :update]
  resources :users, only: [:index, :show, :edit, :update, :destroy]


 end

scope module: :public do
  root "homes#top"
  get "/about" => "homes#about"
  get "/users/unsubscribe" => "users#unsubscribe"
  patch "/users/is_deleted" => "users#is_deleted"
  resources :users,only: [:index, :create, :new, :show, :edit, :update, :destroy] do
    member do
    get :likes
   end
  end
  resources :posts,only: [:new,:create,:index,:show,:destroy,:edit,:update] do
   resource :likes, only: [:create, :destroy]
   resources :comments, only: [:create, :destroy]
   get 'search'
   end
  get 'keyword_search' => "posts#keyword_search"
  get "/search" => "posts#search"

 end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
