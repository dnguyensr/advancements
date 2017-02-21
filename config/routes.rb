Rails.application.routes.draw do
  resources :advancements do
    resources :ranks do
      resources :requirements
    end
  end
  # get 'users' => 'users#index'
  # get 'users/:id' => 'users#show'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
