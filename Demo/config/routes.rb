Rails.application.routes.draw do
  devise_for :admins
  devise_for :mailboxes

  resources :admins, only: :index
  resources :mailboxes
  resources :emails
  
  devise_scope :mailbox do
    root "devise/sessions#new"
  end
end
