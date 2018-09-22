Rails.application.routes.draw do
  root to: "home#index"

  resources :advisories
  resources :documents
  resources :projects
  resources :companies_cities
  resources :entrep_courses
  resources :tutors
  resources :courses
  resources :advisers
  resources :entrepreneurs
  resources :users
  resources :companies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
