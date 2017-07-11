Rails.application.routes.draw do
  resources :registrations
  mount EmphaticInvalids::Engine => "/emphatic_invalids"
end
