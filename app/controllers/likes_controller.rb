class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    updated_like = @post.likes.create(author_id: current_user.id, post_id: @post.id)
    updated_like.update_counter_of_likes
    if updated_like.save
      flash[:notice] = 'Congratulations, likes created successfully'
    else
      flash.now[:error] = 'Oups! failed to add a like, do it later!!'
    end
    redirect_to "/users/#{@post.author_id}/posts/#{@post.id}"
  end
end
