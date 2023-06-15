Rails.application.routes.draw do



  namespace :public do
    get 'comments/index'
    get 'comments/show'
    get 'comments/edit'
  end
  namespace :public do
    get 'posts/show'
    get 'posts/edit'
    get 'posts/index'
  end
  namespace :public do
    get 'users/show'
    get 'users/index'
    get 'users/edit'
  end

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
 end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
