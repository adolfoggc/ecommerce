Rails.application.routes.draw do
	root to: 'order#index'
	get '/orders/:id', to: 'order#show'
	post '/orders', to: 'order#create'
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	post '/products', to: 'products#create'
	post '/products/edit', to: 'products#update'
	delete '/products/:id', to: 'products#destroy'
	get '/products/in_stock', to: 'products#in_stock'

	post '/special_offers/', to: 'special_offer#create'
	patch '/special_offers/:id', to: 'special_offer#update'
	delete '/special_offers/:id', to: 'special_offer#destroy'
end
