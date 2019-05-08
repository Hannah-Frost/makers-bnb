require 'sinatra/base'
require './lib/property.rb'
require './lib/user.rb'

class MakersBnB < Sinatra::Base

enable :sessions

  get '/' do
    erb :user
  end

  post '/create_account' do
    User.add(name: params[:name], email: params[:email], password: params[:password])
    session[:name] = params[:name]
    redirect '/properties'
  end

  post '/sign_in' do
    session[:account_email] = params[:account_email]
    redirect '/properties'
  end

  get '/properties' do
    @user = User.exist?(account_email: session[:account_email])
    @property = Property.all
    @name = session[:name]
    erb :properties
  end

  get '/add' do
    erb :add
  end

  post '/add' do
    Property.add(name: params[:name], description: params[:description], price: params[:price])
    redirect '/properties'
    #redirect to property ID page?
  end

run! if app_file == $0
end
