require 'sinatra/base'
require 'sinatra/activerecord'

class MakersBnB < Sinatra::Base

  register Sinatra::ActiveRecordExtension
  enable :sessions, :method_override

  configure :development do
    set :database, { adapter: 'postgresql',  encoding: 'unicode', database: 'makers_bnb' }
  end

  configure :test do
    set :database, { adapter: 'postgresql',  encoding: 'unicode', database: 'makers_bnb_test' }
  end

  get '/' do
    erb :index
  end

  get '/register' do

  end

  post '/register' do
    redirect('/')
  end

  get '/login' do

  end

  post '/login' do

  end

  get '/spaces' do
    @spaces = Space.order(:country)
    erb :spaces
  end

  get '/spaces/new' do
    erb :new_space
  end

  post '/spaces/new' do
    @space = Space.create(name: params[:name], description: params[:description], price: params[:price], street_address: params[:street_address], country: params[:country], postcode: params[:postcode], city: params[:city])
    redirect('/spaces')
  end

  run! if app_file == $0
end
