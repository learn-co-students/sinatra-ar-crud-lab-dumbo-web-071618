require 'pry'
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    @posts = Post.all
    erb :index
  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    @new_post = Post.create(params)
    @posts = Post.all
    redirect to "/posts"
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    @new_post = Post.find(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do
    @new_post = Post.find(params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    new_post = Post.find(params[:id])

    new_post.update(params["post"])

    redirect to("/posts/#{new_post.id}")
  end

  delete '/posts/:id' do
    new_post = Post.find(params[:id])
    new_post.destroy
    redirect to ("/posts")
  end
end
