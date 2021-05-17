Rails.application.routes.draw do
  get '/orders/index', to: 'orders#index'
  get '/orders/:id', to: 'orders#show'
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	post '/products', to: 'products#create'
  post '/products/edit', to: 'products#update'
  delete '/products/:id', to: 'products#destroy'
end
