Rails.application.routes.draw do

  devise_for :users
    # comments routes
    resources :posts do
        resources :comments
    end

    root to: "posts#index"

end
