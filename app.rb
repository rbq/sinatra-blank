class Application < Sinatra::Base

  # Uncomment this if you use Rack middlewate instead of 
  # browser plugin
  use Rack::LiveReload

  set :views, Proc.new { File.join root, "app/views" }

  get '/' do
    haml :index
  end

  #  Hack for sass files
  get '/stylesheets/:file.css' do |file|
    scss file.to_sym, :views => './app/assets/stylesheets'
  end

  # Hach for coffeescript
  get '/javascripts/:file.js' do |file|
    coffee file.to_sym, :views => './app/assets/javascripts'
  end
end
