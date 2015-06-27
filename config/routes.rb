Rails.application.routes.draw do

  devise_for :user
  # if authenticate_user doesn't work, may need to add
  # devise_fur :user
  resources :posts

  root "posts#index"
end
