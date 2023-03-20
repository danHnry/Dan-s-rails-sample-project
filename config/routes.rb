Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "invoices#index" 

  resources :invoices do
    resources :invoice_items
  end
  
  # Defines the root path route ("/")
  # root "articles#index"
end
