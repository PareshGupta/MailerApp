Rails.application.routes.draw do
  resources :mailboxes
  resources :emails
  root "mailboxes#index"
end
