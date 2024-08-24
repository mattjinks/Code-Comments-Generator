Rails.application.routes.draw do
  post '/comments', to: 'comments#generate'
end
