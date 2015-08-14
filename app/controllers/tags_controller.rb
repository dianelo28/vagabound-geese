class TagsController < ApplicationController

  def destroy
  	  tag = Tag.find_by(:id)
  	  tag.destroy
  	  redirect_to root_path
  end
  
end
