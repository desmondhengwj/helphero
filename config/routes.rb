Rails.application.routes.draw do
  get 'static/homepage'

  devise_for :users
  get 'pages/info'
  resources :helpers do
    resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static#homepage'

end
