Rails.application.routes.draw do
namespace :api do
  resources :artist do
    resources :songs, only: [:index, :show]
  end
end
end
