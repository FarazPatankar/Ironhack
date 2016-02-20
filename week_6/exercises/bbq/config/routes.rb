Rails.application.routes.draw do
  devise_for :users
  root 'barbecues#index'

  resources :barbecues, only: [ :index, :show, :new, :create ]

  scope "/api" do
  	resources :barbecues, controller: "barbecues_api"
  end

  post "/api/barbecues/:id/join" => "barbecues_api#join"
  post "/api/barbecues/:id/create" => "barbecues_api#create_item"
end
