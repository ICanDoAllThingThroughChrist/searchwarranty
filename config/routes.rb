Rails.application.routes.draw do
    root to: "carts#new"
    resources :carts, only: [:new, :create]
    get 'srs/result', to: 'srs#result'
    get 'srs/test', to: 'srs#test'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
