Rails.application.routes.draw do

  root 'urls#new'

  get 'urls/new'

  get 'urls/create'

  get 'urls/:id', to: 'urls#show', as: 'url_show'

  post '/urls/create', to: 'urls#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
