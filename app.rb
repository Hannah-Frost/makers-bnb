require 'sinatra/base'
require './lib/property.rb'

class MakersBnB < Sinatra::Base

  get '/' do
  end

  get '/properties' do
    @property = Property.all
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
