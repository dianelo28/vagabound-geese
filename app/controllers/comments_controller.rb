class CommentsController < ApplicationController
  def index

  end

  def new
  	render :new
  	@comment = Comment.new
  end

  def create
  	if current_user
  		post = Post.friendly.find(params[:comment][:post_id])
  		comment = post.comments.new(comment_params)
  		if comment.save
  			redirect_to :back
  			flash[:success] = "Your comment was saved!"
  		else
  			redirect_to :back
  			flash[:error] = "Your opinion does NOT matter!"
  		end
  	end	
  end

  def show
  end
  
  def count
    @post = Post.find(params[:post_id])
    @comment = @post.comments.count(params[:comment])
  end
  
    
  private
  def comment_params
  	params.require(:comment).permit(:description, :post_id)
  end

end
