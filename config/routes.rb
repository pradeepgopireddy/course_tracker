Rails.application.routes.draw do
	namespace :api, format: 'json' do
		namespace :v1 do
			resources :clients
		end
	end
  resources :courses
  resources :instructors
  resources :students
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
