Rails.application.routes.draw do
  resources :conversations, only: [:index, :create]
  resources :messages, only: [:create]

  mount ActionCable.server => '/cable'
  # since ActionCable is its own protocol, typical 'Get'/'Post'/etc. routes are not relevant - this mounting creates an endpoint called 'cable' (by convention) that serves as the endpoint where the client instantiates the websocket connection with the server 
end
