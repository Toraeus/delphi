require_relative 'config/boot'
require 'sinatra'


get '/' do
  'Hello world!'
end

get '/login' do
  erb :login
end

