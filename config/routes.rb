Rails.application.routes.draw do
  get '/mechanics', to: 'mechanics#index'
  get '/mechanics/:id', to: 'mechanics#show'
  post '/mechanics/:id', to: 'mechanics#new'

  get '/amusement_parks/:id', to: 'amusement_parks#show'
end
