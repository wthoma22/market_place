require 'api_constraints'

MarketPlaceApi::Application.routes.draw do
  # Api definition
  namespace :api, defaults: { format: :json },
                              constraints: { subdomain: 'api' }, path: '/'  do
    scope module: :v1,
              constraints: ApiConstraints.new(version: 1, default: true) do
      # We are going to list our resources here
      resources :users, :only => [:show, :create, :update, :destroy] do
        resources :products, :only => [:create, :update, :destroy]
      end
      devise_for :users
      resources :sessions, :only => [:create, :destroy]
      resources :products, :only => [:show, :index]
      resources :orders, :only => [:index, :show]
    end
  end
end
