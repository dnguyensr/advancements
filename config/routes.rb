Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  root to: "home#index"
  resources :advancements do
    resources :ranks do
      resources :requirements
    end
  end
  # get 'users' => 'users#index'
  # get 'users/:id' => 'users#show'
end
