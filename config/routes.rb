Rails.application.routes.draw do
  root to: 'welcome#show'

  get     '/registration', to: "users#new"
  post    '/users', to: "users#create"

  get     '/advice', to: "advice#show"
  post    '/advice', to: "advice#create"

  get     '/login', to: "sessions#new"
  post    '/login', to: "sessions#create"
  delete  '/logout', to: "sessions#destroy"
end
