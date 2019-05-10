require 'sinatra/base'
require './lib/property.rb'
require './lib/user.rb'
require './lib/calendar.rb'

class MakersBnB < Sinatra::Base

enable :sessions

  get '/' do
    session[:calendar] = Calendar.new
    erb :user
  end

  post '/create_account' do
    user = User.add(name: params[:name], email: params[:email], password: params[:password])
    session[:name] = user.name
    session[:email] = user.email
    redirect '/properties'
  end

  post '/sign_in' do
    user = User.new(name: params[:account_name], email: params[:account_email], password: params[:password])
    session[:name] = user.name
    session[:email] = user.email
    redirect '/properties'
  end

  get '/sign_out' do
    session[:name] = nil
    session[:email] = nil
    redirect '/'
  end

  get '/properties' do
    @calendar = session[:calendar]
    @user = User.exist?(session[:email])
    @property = Property.all
    @name = session[:name]
    @email = session[:email]
    erb :properties
  end

  get '/property' do
    @property = Property.all
    erb :property
  end

  post '/property' do
    calendar = Calendar.new
    calendar.add_month(params[:month])
    session[:calendar] = calendar
    redirect '/confirm_booking'
  end

  get '/confirm_booking' do
    @calendar = session[:calendar]
    erb :confirm_booking
  end

  post '/confirm_booking' do
    calendar = session[:calendar]
    calendar.book
    redirect '/properties'
  end

  get '/add' do
    erb :add
  end

  post '/add' do
    Property.add(name: params[:name], description: params[:description], price: params[:price])
    redirect '/properties'
  end

run! if app_file == $0
end
