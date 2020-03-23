require 'sinatra/base'
require 'sinatra/activerecord'

class MakersBnB < Sinatra::Base

  register Sinatra::ActiveRecordExtension
  enable :sessions

  configure :development do
    set :database, { adapter: 'postgresql',  encoding: 'unicode', database: 'makersBnB' }
  end

  configure :test do
    set :database, { adapter: 'postgresql',  encoding: 'unicode', database: 'makersBnB_test' }
  end

  get '/' do
    "Hello"
  end

  run! if app_file == $0
end
