Rails.application.routes.draw do

  namespace :api, defaults: { format: 'json' } do
    resource :session, only: %i(show create destroy)
    resources :users
    resources :products
    resources :product_categories
    resources :grocery_items
    resources :groceries
    resources :logs, only: :index
  end

  get "*path" => "application#index"
  root to: "application#index"
end
