require 'sinatra/base'

class Battle < Sinatra::Base

  get '/' do
  end

  run! if app_file == $0
end
