Rails.application.routes.draw do
    # comments routes
    resources :comments
    # posts routes
    resources :posts
end
