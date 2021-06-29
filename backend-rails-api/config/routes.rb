Rails.application.routes.draw do
  # API
  root to: 'application#index'
  draw :v1

  match '*path', to: 'shopify#index', via: :all
end
