#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:leprosorium.db"

class Post < ActiveRecord::Base
  validates :username, presence: true
  validates :content, presence: true
end

class Comment < ActiveRecord::Base
end

before do
  @posts = Post.all
end

get '/' do
  @new = Post.new
	erb :index
end

get '/new' do
  @new = Post.new
  erb :new
end

post '/new' do
  @new = Post.new params[:post]

  if @new.save
    redirect '/'
  else
    @error = @new.errors.full_messages.first
    erb :new
  end
end

get '/comments/:id' do
  @post = Post.find(params[:id])
  erb :comments
end

post '/comments/:post_id' do

end