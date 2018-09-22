Rails.application.routes.draw do
  resources :tutors
  resources :projects
  resources :entrep_courses
  resources :companies_cities
  resources :companies
  resources :courses
  resources :entrepreneurs
  resources :advisories
  resources :advisers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
