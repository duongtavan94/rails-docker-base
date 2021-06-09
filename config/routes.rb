Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  require 'sidekiq/web'
  require 'sidekiq-scheduler/web'

  Sidekiq::Web.use Rack::Auth::Basic do |username, password|
    username == ENV['BASIC_USER'] && password == ENV['BASIC_PASSWORD']
  end
  mount Sidekiq::Web => '/sidekiq'

  get 'health_check' => 'elb#healthcheck'
end
