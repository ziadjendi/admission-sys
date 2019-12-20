Rails.application.routes.draw do
resources :students do
  member do
    get :delete
  end
  member do
    get :another_details
  end
  member do
    get :education_details
  end
  member do
    get :edit_another_details
  end
  member do
    get :edit_education_details
  end
  member do
    get :show_education_details
  end
  member do
    get :show_another_details
  end
  member do
    get :profile
  end
  collection do
    get :export
  end
end

resources :parents do
  member do
    get :delete
  end
end
resources :batches do
  member do
    get :delete
  end
end
resources :interviews do
  member do
    get :delete
  end
end
resources :interviews_students do
  member do
    get :delete
  end
  collection do
    post :import
  end
  collection do
    get :init_import
  end
end
resources :candidates do
  member do
    get :delete
  end
end
resources :users do
  member do
    get :delete
  end
end
resources :privileges do
  member do
    get :delete
  end
end
resources :privileges_users do
  member do
    get :delete
  end
end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
