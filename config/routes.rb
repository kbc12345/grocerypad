Rails.application.routes.draw do

  namespace :api, defaults: { format: 'json' } do
    resource :session, only: %i(show create destroy)
    resources :users
    resources :products
    resources :product_categories

    resources :groceries do
      member do
        resources :grocery_items
      end
    end
    
    resources :logs
  end

  get "*path" => "application#index"
  root to: "application#index"
end
