Rails.application.routes.draw do
  resources :carts, only: [:new, :create]
  get 'srs/result', to: 'srs#result'
  get 'srs/test', to: 'srs#test'
  get 'open_srs/test', to: 'open_srs#test'
  get 'open_srs/test2', to: 'open_srs#test2'
  get 'open_srs/test3', to: 'open_srs#test3'
  get 'open_srs/test4', to: 'open_srs#test4'
  get 'open_srs/test5', to: 'open_srs#test5'
  get 'open_srs/test6', to: 'open_srs#test6'
  get 'open_srs/test7', to: 'open_srs#test7'
  get 'open_srs/test8', to: 'open_srs#test8'
  get 'open_srs/test9', to: 'open_srs#test9'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
