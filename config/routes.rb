Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'cabs#index'
  resources :cabs, only: [:index]
  resources :rides, only: [:create] do
    member do
      put 'start'
      put 'finish'
    end
  end
end
