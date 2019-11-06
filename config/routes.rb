Rails.application.routes.draw do
    root to: "carts#new"
    resources :carts, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
