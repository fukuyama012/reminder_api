Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :categories
      resources :reminders
    end
  end

  #get "/client", to: "static_pages#index"
  namespace :client do
    root "static_pages#index"
  end
  
  root to: ->(_) { [200, { 'Content-Type' => 'text/plain' }, ['ok']] }
end
