require 'sinatra/base'
require 'sinatra/reloader'
require './lib/messages'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/test' do
    'Test page'
  end

  get '/messages' do
    @peeps = Messages.all
    erb :'messages/index'
  end
  run! if app_file == $0
end
