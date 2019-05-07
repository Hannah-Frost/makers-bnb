require 'sinatra/base'

class MakersBnB < Sinatra::Base

  get '/' do
  end

  get '/listings' do
    @property_list = []
    erb :listings
  end
end
