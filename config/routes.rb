Rails.application.routes.draw do
  root "patients#index"
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  resources :patients
end
