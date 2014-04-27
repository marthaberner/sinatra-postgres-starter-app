require 'sinatra/base'

class Application < Sinatra::Application

  def initialize(app=nil)
    super(app)

    # initialize any other instance variables for you
    # application below this comment. One example would be repositories
    # to store things in a database.

  end

  get '/' do
    erb :index, locals: {motorcycles: DB[:motorcycles].to_a}
  end

  get '/motorcycles/new' do
    erb :'motorcycles/new'
  end

  post '/motorcycles' do
    DB[:motorcycles].insert(name: params[:name], description: params[:description])

    redirect '/'
  end

  get '/motorcycles/:id' do

    bike = DB[:motorcycles][id: params[:id]]

    erb :'/motorcycles/show', locals: {bike: bike}

  end
end


