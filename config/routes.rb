Rails.application.routes.draw do

  devise_for :user
  resources :posts do
  	member do
  		put "like", to: "posts#upvote"
  	end
  end
  # if authenticate_user doesn't work, may need to add
  # devise_fur :user

  root "posts#index"
end
