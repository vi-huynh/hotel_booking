Rails.application.routes.draw do
  root to: "home#index"

  resources :payments
  resources :guests
  devise_for :users
  
  draw(:management_user)
  draw(:hotel_rooms)
  draw(:reservations)
  draw(:cancelations)
end
