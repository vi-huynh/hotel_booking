resources :hotels do 
  resources :rooms, only: [:index, :create, :edit, :update, :destroy, :new]
  resources :room_types, only: [:index, :create, :edit, :update, :destroy]
end
