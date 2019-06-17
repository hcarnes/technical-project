Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "zip_codes#index"

  resources :zip_codes, only: [:index] do
    collection do
      post :search
    end
  end
end
