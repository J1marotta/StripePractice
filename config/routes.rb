Rails.application.routes.draw do
  resources :candies do
    member do
      post 'buy'
    end
  end


	devise_for :users

  get 'candies/purchased', to: 'candies#purchased'

  post 'candies/:id/buy', to: 'charges#buy', as: :buy_candy
  resources :charges

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
