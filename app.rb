require 'sinatra/base'
require 'sinatra/activerecord'
require './lib/space'
require './lib/user'

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
    User.create(name: params[:name], email: params[:email], password: params[:password])
    session[:id] = User.find_by_sql ["SELECT id FROM users WHERE email = '#{params[:email]}'"]
    redirect('/spaces')
  end

  get '/login' do

  end

  post '/login' do
    # User.find_by(email: params[:email], password: params[:password])
  end

  get '/spaces' do
    @user = User.find_by(id: session[:id])
    @spaces = Space.order(:price)
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
