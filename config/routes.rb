Rails.application.routes.draw do
  devise_for :users
  get 'welcome/show'

  root 'welcome#show'
end
