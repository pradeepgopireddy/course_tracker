Rails.application.routes.draw do
  resources :cities
	get "instructors/check_email_present"
	namespace :api, format: 'json' do
		namespace :v1 do
			resources :clients
		end
	end
	namespace :api, format:'json' do
		namespace :v1 do
			resources :projects
		end
	end
  resources :courses
  resources :instructors
  resources :students
  root "courses#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
