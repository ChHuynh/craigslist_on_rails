Rails.application.routes.draw do
  resources :categories, only: [:index, :show] do
    resources :articles
  endi
end
