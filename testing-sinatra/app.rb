require 'sinatra'

get '/' do
  'Hello, World!'
end

get '/real_page' do
  'The other page'
end

get '/hi' do
  redirect 'real_page'
end
