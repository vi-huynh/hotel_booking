Rails.application.routes.draw do
  root to: "hotel_catalogs#index"
  resources :inventories

  resources :payments
  resources :guests
  devise_for :users, path: 'users'
  devise_for :admins, path: 'admins'
  scope :admin do 
    draw(:user_managment)
    draw(:hotel_management)
  end

  scope :hotels do 
    draw(:hotel_catalog)
    draw(:reservations)
  end 

  draw(:cancelations)

end
