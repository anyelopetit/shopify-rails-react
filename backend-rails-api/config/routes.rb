Rails.application.routes.draw do
  # API
  root to: 'application#index'
  namespace :v1 do
    resources :orders do
      resources :line_items
      resources :shipments
    end
    resources :products do
      resources :variants
    end
  end


  match '*path', to: 'shopify#index', via: :all
end
