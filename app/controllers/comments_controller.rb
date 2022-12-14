class CommentsController < ApplicationController
  def new
    @add_new_comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @add_new_comment = @post.comments.create(
      text: comment_params[:text],
      author_id: current_user.id,
      post_id: @post.id
    )
    @add_new_comment.author_id = @post.id
    @add_new_comment.post_id = params[:post_id]
    @add_new_comment.update_comments_counter

    if @add_new_comment.save
      flash[:notice] = 'Congratulations! User created successfully'
    else
      flash.now[:error] = 'Oups! Impossible to create comment'
    end
    redirect_to "/users/#{@post.author_id}/posts/#{@post.id}"
  end

  def destroy
    comment = Comment.find(params[:id])
    authorize! :destroy, comment
    comment.destroy
    redirect_to user_post_path(current_user.id, post.id)
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
