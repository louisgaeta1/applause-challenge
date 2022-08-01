Rails.application.routes.draw do
  get '/', to: 'tester#index'
  get 'testers', to: 'tester#index'
  post 'search', to: 'tester#search'
end
