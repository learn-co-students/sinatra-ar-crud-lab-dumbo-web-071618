require_relative '../../config/environment'
require 'pry'

class ApplicationController < Sinatra::Base


  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :method_override, true
  end

  #index action
  get '/posts' do
    @posts = Post.all
    erb :index
  end

  #new action
  get '/posts/new' do
    erb :new
  end

  #create action
  post '/posts' do

    new_post = Post.create(params)
    #binding.pry
    redirect to('/posts')
  end

  #show action
  get  '/posts/:id' do
    @post = Post.find(params["id"])
    erb :show
  end

  #edit action - goes to form to edit
  get '/posts/:id/edit' do
    @post = Post.find(params["id"])
    erb :edit
  end

  #update action
  patch '/posts/:id' do
    post = Post.find(params["id"])
    post.update(params["post"])
    redirect to ("/posts/#{post.id}")
    #binding.pry
  end

  #delete action
  delete '/posts/:id' do
    post = Post.find(params["id"])
    post.destroy
    redirect to('/posts')
  end

end
