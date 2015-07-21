Rails.application.routes.draw do


	scope :module => :design do
		scope :admin do
			scope :form do
				get '/' => 'default#index', :as => :design_default_index
				put '/' => 'default#index', :as => :design_default_index_put
				get '/struct' => 'default#struct', :as => :design_default_struct
				get '/edit/:id' => 'default#edit', :as => :design_default_edit_get
				put '/edit/:id' => 'default#edit', :as => :design_default_edit_put
				get '/form/:id' => 'default#form', :as => :design_default_form_get
				put '/form/:id' => 'default#form', :as => :design_default_form_put
			end

			scope :task do
				get '/' => 'task#index', :as => :task_index
				put '/' => 'task#index', :as => :task_index_put
				get '/struct' => 'task#struct', :as => :task_struct
				get '/edit/:id' => 'task#edit', :as => :task_edit
				put '/edit/:id' => 'task#edit', :as => :task_edit_put
				get '/delete_task_catalog/:id' => 'task#delete_task_catalog', :as => :delete_task_catalog
				get '/delete_task_item/:id' => 'task#delete_task_item', :as => :delete_task_item
				get '/task_type/new' => 'task#task_type', :as => :task_type
				put '/task_type/new' => 'task#task_type', :as => :task_type_put
				get '/task_type/:id' => 'task#edit_task_type', :as => :edit_task_type
				put '/task_type/:id' => 'task#edit_task_type', :as => :edit_task_type_put
			end
		end
	end

	scope module: :my_devise do
		scope :users do
			get '/register' => 'user#register', :as => :user_register
			post '/register' => 'user#register', :as => :user_register_post

			post '/send_sms' => 'user#send_sms', :as => :user_send_sms
		end
	end

	scope :module => :extension do
		scope :memo do
			get '/' => 'memo#index', :as => :memo_index
		end
	end

	scope :module => :api do

		scope :app do
			get '/get_user_task/:user_id' => 'app#get_user_task', :as => 'app_get_user_task', :user_id => /\d+/
			post '/get_user_task' => 'app#get_user_task', :as => 'app_get_user_task_post'
			get '/get_user_task_catalogs/:user_id' => 'app#get_user_task_catalogs', :as => 'get_user_task_catalogs', :user_id => /\d+/
			post '/get_user_task_catalogs' => 'app#get_user_task_catalogs', :as => 'get_user_task_catalogs_post'
			get '/get_task_by_id/:id' => 'app#get_task_by_id', :as => 'get_task_by_id'
			post '/get_task_by_id' => 'app#get_task_by_id', :as => 'get_task_by_id_post'
			get '/get_task_types' => 'app#get_task_types', :as => 'get_task_types'
			post '/get_task_types' => 'app#get_task_types', :as => 'get_task_types_post'
			post '/submit_new_task' => 'app#submit_new_task', :as => 'submit_new_task_post'
			post '/submit_save_task' => 'app#submit_save_task', :as => 'submit_save_task_post'
			post '/signup' => 'app#signup', :as => 'signup_post'
		end

		scope :authenticate do
			get '/authenticate_user' => 'authenticate#authenticate_user', :as => 'authenticate_user_get'
			post '/authenticate_user' => 'authenticate#authenticate_user', :as => 'authenticate_user_post'
		end

	end

	scope :foundation do
		put '/put' => 'foundation#put', :as => :foundation_put
	end

	namespace :api , defaults: {format: :json} do
		resources :works
		resources :work_tasks
    resources :work_categories
		resources :task_types
    resources :invite_letters

		scope :angular do
			post '/get_work' => 'angular#get_work', :as => 'angular_get_work'
			post '/new_task_with_category' => 'angular#new_task_with_category', :as => 'new_task_with_category'
			post '/set_target_date' => 'angular#set_target_date', :as => 'angular_set_target_date'
			post '/set_task_done' => 'angular#set_task_done', :as => 'angular_set_task_done'
		end

    scope :user do
      post '/' => 'angular#index', :as => 'angular_index_post'
			post '/user_sign_in' => 'angular#user_sign_in', :as => 'angular_user_sign_in'
      get '/sign_in_with' => 'angular#sign_in_with', :as => 'angular_sign_in_with'
      post '/sign_up_with_phone' => 'angular#sign_up_with_phone', :as => 'angular_sign_up_with_phone'
      post '/send_invite_email' => 'angular#send_invite_email', :as => 'angular_send_invite_email'
    end

	end

	scope module: :workspace do
		scope :cheerup do
			get '/get_phones/:wedding_code' => 'cheerup#get_phones', :as => 'cheerup_get_phones', :wedding_code => /[0-9a-zA-Z\-]+/
			get '/:wedding_code' => 'cheerup#index', :as => 'cheerup_index', :wedding_code => /[0-9a-zA-Z\-]+/
			get '/join/:wedding_code' => 'cheerup#join', :as => 'cheerup_join', :wedding_code => /[0-9a-zA-Z\-]+/
			post '/join/:wedding_code' => 'cheerup#join', :as => 'cheerup_join_post', :wedding_code => /[0-9a-zA-Z\-]+/
			get '/photos/:wedding_code' => 'cheerup#photos', :as => 'cheerup_photos', :wedding_code => /[0-9a-zA-Z\-]+/
		end
  end

	scope module: :ajax do
		scope :task do

			post '/show_task' => 'task#show_task', :as => :show_task, :id => /\d+/

			get '/get_form' => 'task#get_form', :as => :get_form
			post '/get_form/:id' => 'task#get_form', :as => :get_form_post

			post '/task_finish' => 'task#finish', :as => :task_finish
			post '/task_remove' => 'task#remove', :as => :task_remove

			post '/submit' => 'task#submit', :as => :submit_task
			post '/check_task_status' => 'task#check_task_status', :as => :check_task_status

		end

		scope :project do
			post '/set_project_date' => 'project#set_project_date', :as => :set_project_date
		end
	end

	get '/:id' => 'default#index', :as => :sort_by_time, :id => /\d+/
	get '/new_task_at/:id' => 'default#new_task_at', :as => :new_task_at

  devise_for :users
  root 'workspace/dashboard#index'
end
