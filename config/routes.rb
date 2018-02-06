Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks" }

  namespace :api do
    namespace :v1 do
      resources :monsters do
        member do
          get :fight
        end
      end
      resources :teams
    end
  end
end
