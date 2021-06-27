namespace :v1 do
  resources :orders do
    resources :line_items
    resources :shipments
  end
  resources :products do
    resources :variants
  end
end
