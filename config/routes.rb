Rails.application.routes.draw do

  root 'home#search'
  resources :pdf_spikes

end
