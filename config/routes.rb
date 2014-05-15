GenevarbPres11062014::Application.routes.draw do
  resources :brigades, only: [:new, :create, :index, :edit, :update]

  root to: "brigades#index"
end
