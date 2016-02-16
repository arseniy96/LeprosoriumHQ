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
  validates :username, presence: true
  validates :content, presence: true
end

before do
  @posts = Post.order('created_at DESC')
  @comments = Comment.all
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
  @comment = Comment.new
  erb :comments
end

post '/comments/:id' do
  @post = Post.find(params[:id])
  @comment = Comment.new params[:comments]

  if @comment.save
    erb :comments
  else
    @error = @comment.errors.full_messages.first
    erb :comments
  end

end