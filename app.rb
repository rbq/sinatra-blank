class Application < Sinatra::Base
  get '/' do
    haml :index
  end

  #  Hack for sass files
  get '/stylesheets/:file.css' do |file|
    scss file.to_sym, :views => './public/stylesheets'
  end
end
