Rails.application.routes.draw do

  root 'calculators#home'
  post '/evaluate' => 'calculators#evaluate'

end
