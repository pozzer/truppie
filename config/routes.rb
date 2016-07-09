Rails.application.routes.draw do
  
  resources :bank_accounts
  resources :translations
  
  resources :packages
  
  get 'tags/index'
  get 'languages/index'
  get 'wheres/index'

  get 'contacts/index'  
  post 'contacts/send_form'

  resources :orders
  
  post 'webhook', to: 'orders#webhook'
  get 'new_webhook', to: 'orders#new_webhook'
  
  resources :organizers
  get 'organizers/account_activate/:id', to: 'organizers#account_activate', as: 'organizers_account_activate'
  post 'organizers/transfer_funds', to: 'organizers#transfer_funds', as: 'organizers_transfer_funds'
  
  resources :tours do
    member do
      get 'confirm/(:packagename)', to: 'tours#confirm', as: 'confirm'
      post 'confirm_presence'
      post 'unconfirm_presence'
    end
  end
  
  post 'subscribers/create'
  
  devise_for :users, :controllers => { 
    :registrations => "users/registrations",
    :omniauth_callbacks => "users/omniauth_callbacks"
  }
  
  #devise_scope :user do
  #  get 'orders_from_user', :to => 'devise/sessions#orders_from_user', :as => :orders_from_user
  #end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'
  
  get 'logos' => 'welcome#logos'
  get 'manifest' => 'welcome#manifest'
  get 'how_it_works' => 'welcome#how_it_works'
  get 'privacy' => 'welcome#privacy'
  get 'defs' => 'welcome#defs'
  get 'faq' => 'welcome#faq'
  
  
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
