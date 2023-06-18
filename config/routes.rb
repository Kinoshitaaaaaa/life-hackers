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
 end

scope module: :public do
  root "homes#top"
  get "/about" => "homes#about"
  resources :users,only: [:index, :create, :new, :show, :edit, :update]
  get "/users/unsubscribe" => "users#unsubscribe"
  patch "/users/is_deleted" => "users#is_deleted"
  resources :posts,only: [:new,:create,:index,:show,:destroy,:edit,:update]
 end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
