Rails.application.routes.draw do

  match 'auth/:provider/callback', to: 'users#update', via: 'get'
  match 'auth/failure', to: redirect('/'), via: 'get'

  root 'users#new'
  post '/api/echos' => 'echos#create'
  post '/api/users' => 'users#create'

  get '/o/:short_url' => 'echos#expand', as:'expand'
end
