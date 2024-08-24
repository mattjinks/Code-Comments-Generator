Rails.application.routes.draw do
  get 'comments', to: 'comments#index'
  root 'home#index'
end
