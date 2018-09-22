Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      namespace :inspections do
        post ':inspection_id/photos', to: 'photos#create'
      end
    end
  end
end
