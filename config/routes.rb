Rails.application.routes.draw do

  resources :audios
  resources :poems
  resources :images

  devise_for :users

  root 'welcome#show'
end
