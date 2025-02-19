Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'

  resources :books do
    post :barcode, on: :collection
  end

  get "/profile", to: "pages#profile"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
