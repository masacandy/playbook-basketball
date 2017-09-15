Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope module: :web, defaults: { format: :html } do
    root to: 'top#index'

    resources :cources, only: %i(show) do
      resources :lessons, only: %i(show)
    end

    resources :about, only: %i(index)
    resources :privacy_policy, only: %i(index)
    resources :service_policy, only: %i(index)
  end
end
