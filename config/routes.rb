Rails.application.routes.draw do
  get 'books/index'
  get 'books/show'
  devise_for :users
  root to: 'pages#home'

  get "/profile", to: "pages#profile"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
