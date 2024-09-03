Rails.application.routes.draw do
  post '/comment', to: 'comments#generate'
end