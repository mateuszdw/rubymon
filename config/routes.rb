Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks" }, defaults: { format: :json }

  namespace :api do
    namespace :v1 do
      resources :monsters do
        member do
          get :fight_with
        end
      end
      resources :teams
    end
  end
end
