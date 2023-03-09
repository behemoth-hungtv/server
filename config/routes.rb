Rails.application.routes.draw do
  post 'authenticate', to: 'authentication#authenticate'
  get 'item', to: 'item#list'
end
