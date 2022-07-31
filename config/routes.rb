Rails.application.routes.draw do
  get 'testers', to: 'tester#index'
  post 'search', to: 'tester#search'
end
