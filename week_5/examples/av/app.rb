require "sinatra"
require "sinatra/reloader" if development?

get '/av' do
	erb :av
end