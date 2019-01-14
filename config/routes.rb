Rails.application.routes.draw do
  resources :neopets, only: [:show,:create,:delete]
  resources :users

  get '/neopets/index/:id', to: 'neopets#index', as: 'neopets_user'
  get '/neopets/index/neopets/edit/:id/:pet_id', to: 'neopets#edit', as: 'neopet_edit'
  post '/neopets/:id/:pet_id/edit', to: 'neopets#update'
  get '/neopets/play_song/:id', to: 'neopets#play_song', as: 'neopet_song' 
end
