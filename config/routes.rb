Rails.application.routes.draw do
  get 'results' => 'results#index'
  get 'results/update_cities', as: 'update_cities'
  get 'results/update_states', as: 'update_states'

  root 'results#search'
end
