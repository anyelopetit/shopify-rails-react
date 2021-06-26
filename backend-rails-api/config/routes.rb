Rails.application.routes.draw do
  # API
  draw :v1

  match '*path', to: 'shopify#index', via: :all
end
