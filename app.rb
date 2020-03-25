require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/activerecord'
require './lib/space'
require './lib/user'

class MakersBnB < Sinatra::Base

  register Sinatra::ActiveRecordExtension
  register Sinatra::Flash
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
    erb :login
  end

  post '/login' do
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      session[:id] = @user.id
      redirect('/spaces')
    else
      flash[:notice] = "Please check your email or password"
      redirect('/login')
    end
  end

  get '/spaces' do
    @user = User.find_by(id: session[:id])
    @spaces = Space.order(:price)
    erb :spaces
  end

  get '/spaces/new' do
    @user = User.find_by(id: session[:id])
    erb :new_space
  end

  post '/spaces/new' do
    @space = Space.create(name: params[:name], description: params[:description], price: params[:price], street_address: params[:street_address], country: params[:country], postcode: params[:postcode], city: params[:city])
    redirect('/spaces')
  end

  get '/logout' do
    session.clear
    # flash[:notice] = "You have logged out"
    redirect('/')
  end

  get '/spaces/:id' do
    @space = Space.find_by(id: params[:id])
    erb :view_space
  end

  run! if app_file == $0
end
