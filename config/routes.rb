Rails.application.routes.draw do
  namespace :v1 do
    get '/hello' => 'data_sources#hello'

    resources :data_sources, only: [:index, :show, :update]
  end
end
