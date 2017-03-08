Rails.application.routes.draw do
  resources :advancements do
    resources :ranks do
      resources :requirements, only: [:edit, :update, :create]
    end
  end
  devise_for :users
  get 'users' => 'users#index'
  get 'users/:id' => 'users#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  PagesController.action_methods.each do |action|
    get "/#{action}", to: "pages##{action}", as: "#{action}_page"
  end
  root 'pages#index'
end
