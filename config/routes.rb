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
    resources :users
    resources :organizations
  end
end
