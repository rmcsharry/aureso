Rails.application.routes.draw do
  
  
  namespace :api do
    namespace :v1 do
      resources :cars, except: [:new, :edit] 
      resources :tracks, except: [:new, :edit]
    end
  end
end
