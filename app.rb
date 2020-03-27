require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/activerecord'
require './lib/space'
require './lib/user'
require './lib/booking'
require './lib/booking_requested'
require './lib/booking_received'


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

  post '/register' do
    User.create(name: params[:name], email: params[:email], password: params[:password])
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password_confirmation])
      session[:user_id] = @user.id
      redirect('/spaces')
    else
      flash[:notice] = "Those passwords don't match, please try again"
      redirect('/')
    end
  end

  get '/login' do
    erb :login
  end

  post '/login' do
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect('/spaces')
    else
      flash[:notice] = "Please check your email or password"
      redirect('/login')
    end
  end

  get '/spaces' do
    @user = User.find_by(id: session[:user_id])
    @spaces = Space.order(:price)
    erb :spaces
  end

  get '/spaces/new' do
    @user = User.find_by(id: session[:user_id])
    erb :new_space
  end

  post '/spaces/new' do
    @space = Space.create(name: params[:name], description: params[:description], price: params[:price], street_address: params[:street_address], country: params[:country], postcode: params[:postcode], city: params[:city], owner_id: session[:user_id])
    redirect('/spaces')
  end

  get '/logout' do
    session.clear
    # flash[:notice] = "You have logged out"
    redirect('/')
  end

  get '/spaces/:id' do
    @user = User.find_by(id: session[:user_id])
    @space = Space.find_by(id: params[:id])
    session[:space_id] = params[:id]
    erb :view_space
  end

  post '/requests' do
    @booking = Booking.create(customer_id: session[:user_id],
      space_id: session[:space_id],
      booking_start: params[:start_date],
      booking_end: params[:end_date],
      confirmation: "requested"
    )
    redirect('/requests')
  end

  get '/requests' do
    @user = User.find_by(id: session[:user_id])
    @bookings_requested = BookingRequested.all(session[:user_id])
    @bookings_received = BookingReceived.all(session[:user_id])
    p @bookings_received
    erb :requests
  end

  get '/requests/:id' do
    @user = User.find_by(id: session[:user_id])
    @booking = Booking.find_by(id: params[:id])
    erb :view_request
  end

  post '/requests/:id' do
    @booking = Booking.find_by(id: params[:id])
    @booking.update(confirmation: params[:booking_confirmation])
    redirect('/requests')
  end

  run! if app_file == $0
end
