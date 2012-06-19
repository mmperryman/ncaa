class PostsController < ApplicationController
  
  def index
    @posts = Post.all.sort {|a,b| b.updated_at <=> a.updated_at}
  end
  
  def new
    @post = Post.new
  end
  
  def edit
    @post = Post.find params[:id]
  end
  
  def create
    params[:post][:user_id] = current_user.id
    @post = Post.new params[:post]
    if @post.save
      redirect_to posts_path, notice: 'Post was successfully created.' 
    end  
  end
      
  def update
    @post = Post.find params[:id]
    @post.update_attributes(params[:post])  
    redirect_to posts_path, notice: 'Post was successfully updated.' 
  end
  
  def destroy
    @post = Post.find params[:id] 
    @post.destroy
    redirect_to posts_path, notice: 'Post was successfully destroyed.' 
  end
  
  
end
