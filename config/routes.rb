Rails.application.routes.draw do
 
    resources :travel_logs
    root 'home#home'
  
    get "sign_up", to: 'registrations#new'
    post "sign_up", to: 'registrations#create'
  
    get '/journey_calculator' => 'distfind#journeyCalculator'
  
    post '/distance_profile' => 'distfind#distanceProfileCalc'

    post '/distance_profile' => 'distfind#totalCo2Emission'
  
  
end
