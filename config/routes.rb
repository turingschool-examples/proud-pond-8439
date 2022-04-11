Rails.application.routes.draw do
  get '/mechanics', to:'mechanics#index'
  get '/mechanic/:id', to: 'mechanics#show'
end
