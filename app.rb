#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:leprosorium.db"

class Post < ActiveRecord::Base
end

class Comment < ActiveRecord::Base
end

# before do
#
# end
#
# configure do
#
# end

get '/' do

	erb :index
end

get '/new' do
  erb :new
end

post '/new' do

end

get '/comments/:post_id' do

  erb :comments
end

post '/comments/:post_id' do

end