Rails.application.routes.draw do
  resources :exchange_rates do
    collection do
      get :save
      get :calculate
    end
  end
end
