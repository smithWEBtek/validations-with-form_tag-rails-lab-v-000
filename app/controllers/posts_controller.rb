class PostsController < ApplicationController
  
  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post)
    else 
      render :new
    end
  end

  def update
		@post = Post.find(params[:id].to_i)
		@post.update(post_params)
		if @post.save
			redirect_to post_path(@post)
		else
			render 'posts/edit'
		end
	end
	
  private
	def post_params
    params.permit(:title, :category, :content)
  end
end
