Rails.application.routes.draw do
  get 'subjects/index'

  get 'subjects/show'

  get 'subjects/new'

  get 'subjects/edit'

  get 'subjects/delete'

  # Default route
  root "demo#index"
  # get 'demo/index'
  match ':controller(/:action(/:id))', :via => :get
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
