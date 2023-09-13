get '', to: "hotel_catalogs#index", as: :home
get '/:slug', to: 'hotel_catalogs#show'