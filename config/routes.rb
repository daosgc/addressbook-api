Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    mount_devise_token_auth_for(
      'User',
      at: 'auth',
      controllers: {
        sessions: 'auth/sessions',
        registrations: 'auth/registrations',
      }
    )
    resources :users, only: [:index]
    resources :organizations, param: :organization_id, only: [:create, :index] do
      member do
        resources :contacts, only: [:create, :update, :index], :controller => "organization_contacts"
      end
    end
  end
end
