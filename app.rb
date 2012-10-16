# coding: utf-8

class Application < Sinatra::Base

  # Uncomment this if you use Rack middlewate instead of 
  # browser plugin
  use Rack::LiveReload

  configure do
    mime_type :javascript, 'application/javascript'
  end

  set :views, Proc.new { File.join root, "app/views" }

  get '/' do
    haml :index
  end

  get '/category-index' do
    haml :category_index, :layout => :index
  end

  #  Hack for sass files
  get '/stylesheets/:file.css' do |file|
    scss file.to_sym, :views => './app/assets/stylesheets'
  end

  # Hach for coffeescript
  get '/javascripts/:file.js' do |file|
    if File.exists? "./app/assets/javascripts/#{file}.coffee"
      coffee file.to_sym, :views => './app/assets/javascripts'
    else
      content_type :javascript
      File.read "./public/javascripts/#{file}.js"
    end
  end
end
