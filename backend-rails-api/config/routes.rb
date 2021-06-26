Rails.application.routes.draw do
  # API
  scope module: :api do
    draw :v1
  end
  match '*path', to: 'shopify#index', via: :all
end
