require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/activerecord'
require './lib/space'
require './lib/user'
require './lib/booking'

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
      session[:user_id] = @user.id
      redirect('/spaces')
    else
      flash[:notice] = "Please check your email or password"
      redirect('/login')
    end
  end

  get '/spaces' do
    @user = User.find_by(id: session[:user_id])
    p @user
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
    @space = Space.find_by(id: params[:id])
    session[:space_id] = params[:id]
    p session
    erb :view_space
  end

  post '/requests' do
    @booking = Booking.create(customer_id: session[:user_id],
      space_id: session[:space_id],
      booking_start: Date.new(2020,03,14),
      booking_end: Date.new(2020, 03, 17),
      confirmation: "requested"
    )
    redirect('/requests')
  end

  get '/requests' do
    @customer_id = session[:user_id]
    # @spaces = Space.joins(:bookings).where('bookings.customer_id' => @customer_id
    # @bookings2 = Space.find_by_sql(["SELECT s.name, s.price, b.confirmation FROM spaces s LEFT JOIN bookings b ON s.id = b.space_id WHERE b.customer_id = #{@customer_id}"])
    @booking = ActiveRecord::Base.connection.execute("SELECT s.name, s.description, s.price, b.confirmation FROM spaces s LEFT JOIN bookings b ON s.id = b.space_id WHERE b.customer_id = #{@customer_id}")
    @booking.map do |book|
      p book
    end
    # p @booking[0]

    # @bookings2 = Space.select('spaces.name, spaces.price, bookings.confirmation')
    # .joins(:bookings)
    # .where('bookings.customer_id = 2')
    # @bookings2 = Space.joins(:bookings).select("spaces.name, bookings.confirmation")
    # @bookings = Space.includes(:bookings).references(:bookings).where("bookings.customer_id = '#{@customer_id}'")
    # p @bookings2
    erb :requests
  end

  run! if app_file == $0
end
