class PostsController < ApplicationController

  before_filter :authorize, except: [:index, :show]

  def index
    @posts = Post.all.order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def create

    if current_user
      post = current_user.posts.new(post_params)
        if post.save
          redirect_to "/"
          flash[:success] = "AYYYY Success!" 
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
    @post = Post.find(params[:id])
  end

  def update
    post_id = params[:id]
      post = Post.find(post_id)
    updated_attributes = post_params

    if post.update_attributes(updated_attributes)
        redirect_to post_path
    end
  end

  def destroy
    id = params[:id]
    post = Post.find(id)
    post.destroy
    redirect_to profile_path
  end

  private
  def post_params

    params.require(:post).permit(:title, :city_id, :content)

  end

end
