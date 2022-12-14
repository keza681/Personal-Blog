class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def create
    @user = User.find(params[:user_id])
    @new_post = @user.posts.new(post_params)
    @new_post.likes_counter = 0
    @new_post.comment_counter = 0
    respond_to do |myform|
      myform.html do
        if @new_post.save
          flash[:notice] = 'Congratulations! Post Created Succefully'
          redirect_to "/users/#{@new_post.author.id}/posts/"
        else
          flash.now[:error] = 'Oups! Failed to creste comment'
          render :new
        end
      end
    end
  end

  def destroy
    post = Post.find(params[:id])
    authorize! :destroy, post
    post.destroy
    redirect_to user_posts_path, notice: 'Bravo, You have deleted post succefully!'
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
