class PostsController < ApplicationController

  before_action :require_authentication, only: [:new, :create, :edit, :update, :destroy]

  def index
    @posts = Post.all.order(updated_at: :asc )
    @show_link = true
  end

  def show
    @post = Post.find params[:id]
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params
    @post.user_id = current_user.id
    @post.save
    redirect_to @post
  end

  def edit
    @post = Post.find params[:id]
    redirect_to root_path
  end

  def update
    @post = Post.find params[:id]
    @post.user_id = current_user.id
    @post.update post_params
    redirect_to @post
  end

  def destroy
    @post = Post.find params[:id]
    @post.destroy
    redirect_to root_path
  end

  private
  def post_params
    params[:post].permit(:title, :url, :content, :created_at, :updated_at, :user_id)
  end

end