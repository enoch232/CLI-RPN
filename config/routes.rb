Rails.application.routes.draw do

  root 'calculators#home'
  post '/calculate' => 'calculators#calculate'

end
