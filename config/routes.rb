Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: "home#index"

  namespace :api, defaults: { format: 'json'} do
    namespace :v1 do
      resources :ideas
      # get '/ideas', to: "ideas#index"
    end
  end
end
