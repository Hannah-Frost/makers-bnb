require 'sinatra/base'
require './lib/property.rb'

class MakersBnB < Sinatra::Base

  get '/' do
  end

  get '/properties' do
    @property = Property.all
    erb :properties
  end

end
