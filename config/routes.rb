Rails.application.routes.draw do
  resources :advancements do
    resources :ranks do
      resources :requirements do
        resources :subrequirements
      end
    end
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
