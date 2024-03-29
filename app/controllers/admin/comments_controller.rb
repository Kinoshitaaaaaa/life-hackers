class Admin::CommentsController < ApplicationController
 def create
    post = Post.find(params[:post_id])
    body = user.comments.new(comment_params)
    body.post_id = post.id
    body.save
    redirect_to post_path(post)
 end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to post_path(params[:post_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
