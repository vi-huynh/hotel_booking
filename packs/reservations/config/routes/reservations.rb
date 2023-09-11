resources :reservations, only: [:create, :show] do 
  member do 
    patch :update_guest_info 
    patch :reserved
    get :final_step 
  end 
end
