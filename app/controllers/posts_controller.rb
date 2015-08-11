class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    if current_user
      post = current_user.posts.new(post_params)
        if post.save
          redirect_to "/"
        else
          redirect_to :back
          flash[:error] = "Sorry, Not Sorry!"
        end
    else
      redirect_to "/login"
      flash[:error] = "STOP! Please Log In!"
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def post_params
    params.require(:post).permit(:title, :city, :content)
  end

end
