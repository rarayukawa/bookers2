Rails.application.routes.draw do
    root to: 'homes#top'
  devise_for :users
  # get 'users/show'


get "/home/about" => "homes#about" , as: "about"

 resources :books, only: [:create, :index, :show, :edit, :update, :destroy]
 resources :users

end