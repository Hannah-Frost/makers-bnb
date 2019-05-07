require 'sinatra/base'
require './lib/property.rb'

class MakersBnB < Sinatra::Base

  get '/' do
  end

  get '/add' do
    erb :add
  end


  get '/properties' do
    @property = Property.all
    erb :properties
  end

run! if app_file == $0
end
