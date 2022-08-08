class Api::V1::CommentsController < ApplicationController
  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments
    render json: @comments, status: :ok
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.post_id = params[:post_id]
    @comment.user = current_user

    if @comment.save
      render json: { status: 200, message: 'Congratulations! you have successfully created a comment!',
                     content: { comment: @comment } }
    else
      render json: @comment.errors, status: :bad_request, message: 'Oups! Something went wrong. Comment not created'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
