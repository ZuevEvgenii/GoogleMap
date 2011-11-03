Vitiligo::Application.routes.draw do

  devise_for :users

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  root :to => "home#index"
  match '/countries/country_click' => 'countries#country_click', :as => :country_click
  resources :countries
  resources :groups do
    get :get_markers, :on => :member
    post :sidebar, :on => :member
  end

  match '/pacients/register' => 'pacients#register', :as => :register_pacient
  match '/pacients/sign_out_pacient' => 'pacients#sign_out_pacient', :as => :sign_out_pacient
  match '/pacients/sign_in_pacient' => 'pacients#sign_in_pacient', :as => :sign_in_pacient
  match '/pacients/pacient_password_reset' => 'pacients#pacient_password_reset', :as => :pacient_password_reset
  match '/pacients/edit' => 'pacients#edit', :as => :edit_pacient
  match '/pacients/update_pacient' => 'pacients#update_pacient', :as => :update_pacient

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end

