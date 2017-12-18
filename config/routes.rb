Rails.application.routes.draw do

  resources :poems 
  resources :images

  devise_for :users

  root 'welcome#show'
end
