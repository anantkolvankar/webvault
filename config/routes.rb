Webvault::Application.routes.draw do
  resources :levels

  get "user/create_fetcher"
  resources :folders
scope '/user' do
  resources :assets
end
  devise_for :users
  #get "/home/index" =>'home#index'
  root 'home#index'
  get "app_assets/get/:id" => "assets#get", :as => "download"
  get "browse/:folder_id" => "home#browse", :as => "browse" 
  #for creating folders insiide another folder  
  get "browse/:folder_id/new_folder" => "folders#new", :as => "new_sub_folder" 
  #for uploading files to folders  
  get "browse/:folder_id/new_file" => "assets#new", :as => "new_sub_file" 

  #form for creating new fetcher by admin
  get "new_fetcher" => "users#new_fetcher"
  post "create_fetcher" => "users#create_fetcher"
  get "fetcher" => "users#fetcher"
 
  #form for creating new admin by superadmin
  get "new_admin" => "users#new_admin"
  post "create_admin" => "users#create_admin"
  
  scope "api" do
    get "/emergency/:level" => "api#emergency"
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
